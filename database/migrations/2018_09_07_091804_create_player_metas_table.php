<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreatePlayerMetasTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('player_metas', function (Blueprint $table) {
            //$table->increments('id');
            $table->string('player_id')->index();
            $table->string('meta_key', 255)->index();
            $table->longText('meta_value')->nullable();
            $table->timestamps();
            // $table->foreign('id')
            //       ->references('id')
            //       ->on('players')
            //       ->onUpdate('cascade')
            //       ->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('player_metas');
    }
}
