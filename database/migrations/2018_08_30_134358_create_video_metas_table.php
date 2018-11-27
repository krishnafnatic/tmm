<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateVideoMetasTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('video_metas', function (Blueprint $table) {
            $table->increments('id');
            $table->unsignedBigInteger('video_id')->index();
            $table->string('meta_key', 255)->index();
            $table->longText('meta_value')->nullable();
            $table->timestamps();
            $table->foreign('video_id')
                  ->references('id')
                  ->on('videos')
                  ->onUpdate('cascade')
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
        Schema::dropIfExists('video_metas');
    }
}
