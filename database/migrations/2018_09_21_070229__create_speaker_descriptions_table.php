<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateSpeakerDescriptionsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('speaker_descriptions', function (Blueprint $table) {
            $table->unsignedInteger('speaker_id')->index();
            $table->unsignedInteger('language_id')->index();
            $table->string('name', 100)->index();
            $table->string('designation', 50)->nullable();
            $table->string('short_description', 255)->nullable();
            $table->longText('description')->nullable();
            $table->longText('biography')->nullable();
            $table->string('meta_title', 100)->nullable();
            $table->string('meta_description', 155)->nullable();
            $table->string('meta_keyword', 155)->nullable();
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
        Schema::dropIfExists('speaker_descriptions');
    }
}
