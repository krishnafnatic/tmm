<?php

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
    function getVideos( $type, $tag ) {

        //echo $type.' - '. $tag;die;

        /** 
            security checks
            if you want to do some basic security checks, such as checking the origin of the
            the request against some white list, this is the place to do it
            CORS enablement and other headers
        
            default account values
            if you work on one Brightcove account, put in the values below
            if you do not provide defaults, the client id, and client secret must
            be sent in the request body for each request
        */
        $yesterday = strtotime( date("Y-m-d H:i:s", strtotime('-24 hours', time())) ); 
        $account_id     =   env('account_id');
       

        if ( $type == 'trending' ) {
            
            // Newest Video  = Recent Videos will be lable and heading

            $client_id      =   env( 'cms_video_client_id' );
            $client_secret  =   env( 'cms_video_client_secret' );
            $limit          =   env( 'cms_video_limit' );
            $end_point      =   '?sort=-created_at&limit='.$limit;
            $request_url    =   env( 'cms_video_url' ).$account_id.'/videos'.$end_point;

            // $client_id      =   env('analytics_client_id');
            // $client_secret  =   env('analytics_client_secret');
            // $analytics_data_limit   =   env( 'analytics_data_limit' );
            // $request_url    =   env('analytics_data_url').'?accounts='.$account_id.'&dimensions=video&sort=-video_view&limit='.$analytics_data_limit.'&from='.$yesterday;

        } else if( $type == 'popular' ) {

            $client_id      =   env('analytics_client_id');
            $client_secret  =   env('analytics_client_secret');
            $analytics_data_limit   =   env( 'analytics_data_limit' );
            $request_url    =   env('analytics_data_url').'?accounts='.$account_id.'&dimensions=video&sort=-video_view&limit='.$analytics_data_limit;

        } else if( $type == 'tag' ) {

            $client_id      =   env('cms_video_client_id');
            $client_secret  =   env('cms_video_client_secret');
            $analytics_data_limit   =   env( 'analytics_data_limit' );
            $endpoint       =   '?q=%2Btags:%22'.urlencode( $tag ).'%22&limit='.$analytics_data_limit;
            //$endpoint = '?q=tags:'.$tag.'&limit='.$analytics_data_limit;
            $request_url    =   env('cms_video_url').$account_id.'/videos'.$endpoint;
            

        } else if( $type == 'view' ) {

            $client_id      =   env('analytics_client_id');
            $client_secret  =   env('analytics_client_secret');
            $request_url    =   env('analytics_url').'accounts/'.$account_id.'/videos/'.$tag;
        }

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
            $message = "Error: there was a problem with your Oauth API call"; //. curl_error($ch);
            return $message;
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
            $message = "Error: there was a problem with your CMS API call" . curl_error($ch);
            return $message;
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