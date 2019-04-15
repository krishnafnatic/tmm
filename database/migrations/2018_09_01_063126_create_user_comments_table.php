<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateUserCommentsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('user_comments', function (Blueprint $table) {
            $table->increments('id');
            $table->unsignedInteger('user_id')->index();
            $table->unsignedBigInteger('video_id')->index();
            $table->unsignedInteger('language_id')->index();
            $table->unsignedInteger('parent_id')->default('0');
            $table->longText('comments')->nullable();
            $table->timestamps();
 	    $table->foreign('user_id')
		  ->references('id')
		  ->on('users')
		  ->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('user_comments');
    }
}
