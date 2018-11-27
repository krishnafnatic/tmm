<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use \Carbon\Carbon;
use DB;
use App\Models\Tag;


class FetchTag extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'fetch:tag';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Fetch all video tag from the brightcove';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * get video response using cURL from Brightcove
     *
     * @return Assoc Array
     */
    private function getcURLResponseVideo() {
        /**
         * proxy for Brightcove RESTful APIs
         * gets an access token, makes the request, and returns the response
         * Accessing:
         *         (note you should *always* access the proxy via HTTPS)
         *     Method: POST
         *     request body (accessed via php://input) is a JSON object with the following properties
         *
         * {string} url - the URL for the API request
         * {string} [requestType=GET] - HTTP method for the request
         * {string} [requestBody] - JSON data to be sent with write requests
         * {string} [client_id] - OAuth2 client id with sufficient permissions for the request
         * {string} [client_secret] - OAuth2 client secret with sufficient permissions for the request
         *
         * if client_id, client_secret, or account_id are not included in the request, default values will be used
         *
         * @returns {string} $response - JSON response received from the API
         */

        /** 
            security checks
            if you want to do some basic security checks, such as checking the origin of the
            the request against some white list, this is the place to do it
            CORS enablement and other headers
        */
        header("Access-Control-Allow-Origin: *");
        header("Content-type: application/json");
        header("X-Content-Type-Options: nosniff");
        header("X-XSS-Protection");

        /**
            default account values
            if you work on one Brightcove account, put in the values below
            if you do not provide defaults, the client id, and client secret must
            be sent in the request body for each request
        */
        $account_id     =   env('account_id');
        $client_id      =   env('cms_video_client_id');
        $client_secret  =   env('cms_video_client_secret');
        $request_url    =   env('cms_video_url').$account_id.'/videos';

        $auth_string    = "{$client_id}:{$client_secret}";
        $request_oauth  = env('oauth_url')."?grant_type=client_credentials";
        $ch             = curl_init($request_oauth);
        curl_setopt_array($ch, array(
            CURLOPT_POST           => TRUE,
            CURLOPT_RETURNTRANSFER => TRUE,
            CURLOPT_SSL_VERIFYPEER => FALSE,
            CURLOPT_USERPWD        => $auth_string,
            CURLOPT_HTTPHEADER     => array(
                'Content-type: application/x-www-form-urlencoded',
            ),
        ));

        $response = curl_exec($ch);
        curl_close($ch);

        // Check for errors
        if ($response === FALSE) {
            $message = "Error: there was a problem with your Oauth API call" + curl_error($ch);
            Log::debug($message);
            die();
        }

        // Decode the response
        $responseData = json_decode($response, TRUE);
        $access_token = $responseData["access_token"];

        // get request type or default to GET
        $method = "GET";

        /**
            more security checks
            optional: you might want to check the URL for the API request here
            and make sure it is to an approved API
            and that there is no suspicious code appended to the URL

            get the URL and authorization info from the form data
            send the http request
        */
        
        $ch = curl_init($request_url);
            curl_setopt_array($ch, array(
            CURLOPT_CUSTOMREQUEST  => $method,
            CURLOPT_RETURNTRANSFER => TRUE,
            CURLOPT_SSL_VERIFYPEER => FALSE,
            CURLOPT_HTTPHEADER     => array(
              'Content-type: application/json',
              "Authorization: Bearer {$access_token}",
            )
        ));
        $response = curl_exec($ch);
        curl_close($ch);

        /**
            Check for errors and log them if any
            note that logging will fail unless
            the file log.txt exists in the same
            directory as the proxy and is writable
        */
        if ($response === FALSE) {
            $message = "Error: there was a problem with your CMS API call" + curl_error($ch);
            Log::debug($message);
            die();
        }

        /**
            Decode the response
            $responseData = json_decode($response, TRUE);
            return the response to the AJAX caller
            TRUE will convert STD Object to assoc Array
        */
        $responseDecoded = json_decode($response, TRUE);
        if (!isset($responseDecoded)) {
            $response = '{null}';
        }

        return $responseDecoded;
    }

    /**
     * Execute the console command.
     *
     * @return mixed
     */
    public function handle() {
        
        $getcURLResponse = $this->getcURLResponseVideo();

        $this->info('Fetch Video tags Cron Job Started!');

        /*
            Count Total Videos Fetch from brightcove via CMS API
        */
        $totalVideos = count($getcURLResponse);

        /*
            Condition if > 0 then add into db;
            else show msg 
        */
        if($totalVideos > 0) {

            for($i=0; $i<$totalVideos; $i++) {

                $video_data = $getcURLResponse[$i];

                $this->conditionOnVideoTagAddition( $video_data);
            }

        }   else {
            $this->info('There are no video found using cURL from brightcove to add into database!');
        }

        $this->info('Fetch Video tags Cron Job Ended!');
    }

    /*
        check conditions like: slug, name and id
    */
    private function conditionOnVideoTagAddition( $data ) {

        $tags = array();
        foreach($data['tags'] as $tag ) {

            $checkTagIsAlreadyExists = $this->checkTagIsAlreadyExists( $tag );

            if($checkTagIsAlreadyExists == 0) {
                $this->addVideoTag( $tag );
                $this->info( 'video_id -'. $data['id'] .'  tag is newly added into database!' );
            }   else  {
                $this->info( 'video_id -'. $data['id'] .'  tag is already added into database!' );
            }
        }
    }

    /**
        Check Tag Already Exists;
    */
    private function checkTagIsAlreadyExists( $tag ) {

        /*
            count records using video id
        */

        $countTags = Tag::where( 'tag', $tag )->count() ?? '0';

        return $countTags;
    }

    /**
        Add Video Tag
    */

    private function addVideoTag( $tag ) {

        /**
            Current Time Using Carbon;
        */
        $current_time   =   Carbon::now()->toDateTimeString();

        Tag::create([ 
            'tag'          =>  $tag,
            'created_at'    =>  $current_time,
            'updated_at'    =>  $current_time,
        ]);
    }
}