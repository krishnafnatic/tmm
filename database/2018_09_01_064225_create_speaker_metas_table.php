<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateSpeakerMetasTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('speaker_metas', function (Blueprint $table) {
            $table->increments('id');
            $table->unsignedInteger('speaker_id')->index();
            $table->string('meta_key', 255);
            $table->longText('meta_value')->nullable();
            $table->timestamps();
            $table->foreign('speaker_id')
                  ->references('id')
                  ->on('speakers')
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
        Schema::dropIfExists('speaker_metas');
    }
}
