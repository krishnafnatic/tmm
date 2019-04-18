<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Contracts\Queue\ShouldQueue;

class SubscribeMe extends Mailable
{
    use Queueable, SerializesModels;

    public $user_subscribe;

    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct($user_subscribe)
    {
        $this->user_subscribe = $user_subscribe;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        return $this->view('emails.subscribeMe');
    }
}
