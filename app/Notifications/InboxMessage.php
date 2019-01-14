<?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Notifications\Notification;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;
use App\Http\Requests\ContactFormRequest;

class InboxMessage extends Notification
{
    use Queueable;

    protected $message;

    /**
     * Create a new notification instance.
     *
     * @return void
     */
    public function __construct( contactFormRequest $message )
    {
        $this->message = $message;
    }

    /**
     * Get the notification's delivery channels.
     *
     * @param  mixed  $notifiable
     * @return array
     */
    public function via($notifiable)
    {
        return ['mail'];
    }

    /**
     * Get the mail representation of the notification.
     *
     * @param  mixed  $notifiable
     * @return \Illuminate\Notifications\Messages\MailMessage
     */
    public function toMail($notifiable) {

        return (new MailMessage)
                    ->to( "viveklaw@gmail.com" )
                    ->cc( "hello@themoneymile.com" )
                    ->from( $this->message->email, $this->message->name)
                    ->subject(config('admin.name'). ", ".config('admin.msg'))
                    ->greeting( " " )
                    ->salutation( " " )
                    ->line('"'. $this->message->name.'"'.' has contacted from contact us form. Below are the details')
                    ->line("Email ID is: ". $this->message->email)
                    ->line("Message is: ". $this->message->message);
    }

    /**
     * Get the array representation of the notification.
     *
     * @param  mixed  $notifiable
     * @return array
     */
    public function toArray($notifiable)
    {
        return [
            //
        ];
    }
}
