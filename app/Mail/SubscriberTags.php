<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Contracts\Queue\ShouldQueue;

class SubscriberTags extends Mailable
{
    use Queueable, SerializesModels;

    public $videos;

    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct( $videos )
    {
        $this->videos = $videos;

        // print '<pre>';
        //     print_r($videos);
        // print '</pre>'; die('mail');
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        return $this->view( 'emails.tagSubscribers' );
    }
}
