<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\Models\Player;
use App\Models\PlayerMeta;
use \Carbon\Carbon;
use DB;

class FetchPlayer extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'fetch:player';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Fetch all player listing from the brightcove';

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
     * get player response using cURL from Brightcove
     *
     * @return Assoc Array
     */
    private function getcURLResponsePlayer() {
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
        $client_id      =   env('player_client_id');
        $client_secret  =   env('player_client_secret');
        $request_url    =   env('player_url').$account_id.'/players';

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

        $getcURLResponse = $this->getcURLResponsePlayer();

        $this->info('Fetch Palyer Cron Job Started!');

        /*
            Count Total Players Fetch from brightcove via CMS API
        */
        $totalPlayers = $getcURLResponse['item_count'];

        /*
            Condition if > 0 then add into db;
            else show msg 
        */
        if($totalPlayers > 0) {

            for($i=0; $i<$totalPlayers; $i++) {

                $player_data = $getcURLResponse['items'][$i];

                $this->conditionOnPlayerAddition( $player_data);
            }

        }   else {
            $this->info('There are no player found using cURL from brightcove to add into database!');
        }

        $this->info('Fetch player Cron Job Ended!');
    }

    /*
        check conditions like: slug, name and id
    */
    private function conditionOnPlayerAddition( $data ) {

        $checkPlayerIDIfExists = $this->checkPlayerIDIfAlreadyExists( $data['id'] );

        if($checkPlayerIDIfExists == 0) {

            $this->addPlayer( $data );
            $this->addPlayerMeta( $data );
            $this->info( 'Player - '. $data['name'].' ( '. $data['id'] .' ) is newly added into database!' );

        } else {
            /*
                Update data from brightcove
                @getting updated_at value;
            */
            $updated_at = $data['branches']['master']['updated_at'];
            
                // print '<pre>';
                //     print_r($data['branches']);
                // print '</pre>';die;

            /*
                Value taking from database using player id;
                @getting updated_at value from db;
            */
            $checkUpdateAt = $this->getPlayerUpdatedAt( $data['id'] );

            if( $checkUpdateAt != $updated_at) {

                $this->info( 'There is update in player - '. $data['name'] .' ( '. $data['id'] .' ) ' );
                $this->deleteMetaPlayerUsingID( $data['id'] );
                $this->info( 'Updating records for player - '. $data['name'] .' ( '. $data['id'] .' ) ' );
                $this->addPlayer( $data );
                $this->addPlayerMeta( $data );
            } else {
                $this->info( 'Player - '. $data['name'].' ( '. $data['id'] .' )  is Already Added into database!' );
            }
        }
    }

    /*
        Check Player ID; 
        If already exists;
    */
    private function checkPlayerIDIfAlreadyExists( $player_id ) {

        /*
            count records using player id
        */

        $countPlayers  = Player::where( 'player_id', $player_id )->count() ?? '0';

        return $countPlayers;
    } 

    /**
        Add Player;
    */
    private function addPlayer( $data ) {

        /**
            Current Time Using Carbon;
        */
        $current_time   =   Carbon::now()->toDateTimeString();

        Player::create([ 
            'player_id'     =>  $data['id'],
            'name'          =>  $data['name'],
            'created_at'    =>  $current_time,
            'updated_at'    =>  $current_time,
        ]);
    }

    /**
        Add player Metas
    */
    private function addPlayerMeta( $data ) {

        foreach( $data as $key => $value ) {

            $player_id       =   $data['id'];
            $current_time   =   Carbon::now()->toDateTimeString();
            
            if(is_array($value)) {

                $meta_value = $this->encode( $value );

                $this->addMetaPlayerToDB( $player_id, $key, $meta_value, $current_time );
            } else {
                $this->addMetaPlayerToDB( $player_id, $key, $value, $current_time );
            }
        }    
    } 

    /**
        Encode the array data in serialize with encoded in json;
    */
    private function encode($data) {
        return serialize( json_decode( json_encode($data), true ) );
    }

    /**
        Decode the array data in serialize with encoded in json;
    */
    private function decode($data) {
        return unserialize( json_decode( $data ) );
    }

    /**
        Adding player Meta to DB;
    */
    private function addMetaPlayerToDB( $id, $key, $value, $time ) {
        DB::table('player_metas')->insert([  
            [   
                'player_id'     =>  $id, 
                'meta_key'      =>  $key,   
                'meta_value'    =>  $value,  
                'created_at'    =>  $time, 
                'updated_at'    =>  $time
            ],
        ]);
    }

    /*
        get meta_key => 'udpated_at' value
    */ 
    private function getPlayerUpdatedAt( $id ) {
        $queryPlayerMeta = PlayerMeta::where( 'player_id', $id )
                                    ->where( 'meta_key', 'branches' )
                                    ->select( 'meta_value' )
                                    ->first(); 
        $master_data = unserialize($queryPlayerMeta['meta_value']);

        return $master_data['master']['updated_at'];
    }

    /*
        @Delete Meta using player_id
    */
    private function deleteMetaPlayerUsingID( $id ) {

        Player::where( 'player_id', $id )->delete();
        PlayerMeta::where( 'player_id', $id )->delete();
    }
}
