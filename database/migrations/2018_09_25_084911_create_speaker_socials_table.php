<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateSpeakerSocialsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('speaker_socials', function (Blueprint $table) {
            $table->increments('id');
            $table->unsignedInteger('speaker_id')->index();
            $table->string('facebook', 50)->nullable();
            $table->string('linkedin', 50)->nullable();
            $table->string('google', 50)->nullable();
            $table->string('twitter', 50)->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('speaker_socials');
    }
}
