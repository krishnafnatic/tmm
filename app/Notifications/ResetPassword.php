<?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Notifications\Notification;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;

class ResetPassword extends Notification
{
    use Queueable;

    public $token;

    /**
     * Create a new notification instance.
     *
     * @return void
     */
    public function __construct( $token )
    {
        $this->token = $token;
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
    public function toMail($notifiable)
    {
        $link = url( "/password/reset/?token=" . $this->token );
        return (new MailMessage)
                    ->view('reset.emailer')
                    ->from( env( 'MAIL_RESET_FROM_ADDRESS') )
                    ->subject( 'Reset Your The Money Mile Password' )
                    ->line('Forgot your password? Let\'s get you a new one.')
                    ->line('We got a request to change the password for the account with the email.')
                    ->line('If you don\'t want to reset your password, you can ignore this email.')
                    ->line('If you didn\'t request this change, you may want to review your account security settings.')
                    ->action( 'Reset Your Password', $link )
                    ->line('Kind regards,');
                    ->line('The Money Mile Team');
                    ->line('If you’re having trouble clicking the "Reset Password" button, copy and paste the URL below into your web');
                    ->line('browser:'.$link);
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
