<?php

namespace App\Console;

use Illuminate\Console\Scheduling\Schedule;
use Illuminate\Foundation\Console\Kernel as ConsoleKernel;

class Kernel extends ConsoleKernel
{
    /**
     * The Artisan commands provided by your application.
     *
     * @var array
     */
    protected $commands = [
        Commands\FetchVideo::class,
        Commands\FetchPlaylist::class,
        Commands\FetchTag::class,
        Commands\FetchPlayer::class,
        Commands\TagSubscribers::class,
    ];

    /**
     * Define the application's command schedule.
     *
     * @param  \Illuminate\Console\Scheduling\Schedule  $schedule
     * @return void
     */
    protected function schedule(Schedule $schedule)
    {
        $schedule->command('fetch:video')
            ->daily(); //Run the task every day at midnight

        $schedule->command('fetch:playlist')
            ->daily(); //Run the task every day at midnight

        $schedule->command('fetch:tag')
            ->daily(); //Run the task every day at midnight

        $schedule->command('fetch:player')
            ->daily(); //Run the task every day at midnight

        $schedule->command('tag:subscribers')
            ->daily(); //Run the task every day at midnight
        // $schedule->command('inspire')
        //          ->hourly();
        // $schedule->command('word:day')
        //     ->daily();
    }

    /**
     * Register the commands for the application.
     *
     * @return void
     */
    protected function commands()
    {
        $this->load(__DIR__.'/Commands');

        require base_path('routes/console.php');
    }
}
