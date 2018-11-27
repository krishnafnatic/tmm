<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreatePlaylistMetasTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('playlist_metas', function (Blueprint $table) {
            $table->increments('id');
            $table->unsignedBigInteger('playlist_id')->index();
            $table->string('meta_key', 255)->index();
            $table->longText('meta_value')->nullable();
            $table->timestamps();
            $table->foreign('playlist_id')
                  ->references('id')
                  ->on('playlists')
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
        Schema::dropIfExists('playlist_metas');
    }
}
