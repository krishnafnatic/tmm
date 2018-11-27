<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateInformationDescriptionsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('information_descriptions', function (Blueprint $table) {
            $table->unsignedInteger('information_id')->index();
            $table->unsignedInteger('language_id')->index();
            $table->string('title', 100)->index();
            $table->string('short_description', 255)->nullable();
            $table->longText('description')->nullable();
            $table->string('meta_title', 100)->nullable();
            $table->string('meta_description', 155)->nullable();
            $table->string('meta_keyword', 155)->nullable();
            $table->foreign('information_id')
                  ->references('id')
                  ->on('informations')
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
        Schema::dropIfExists('information_descriptions');
    }
}
