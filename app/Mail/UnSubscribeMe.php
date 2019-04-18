<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Contracts\Queue\ShouldQueue;

class UnSubscribeMe extends Mailable
{
    use Queueable, SerializesModels;

    public $user_unsubscribe;

    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct($user_unsubscribe)
    {
        $this->user_unsubscribe = $user_unsubscribe;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        return $this->view('emails.unSubscribeMe');
    }
}
