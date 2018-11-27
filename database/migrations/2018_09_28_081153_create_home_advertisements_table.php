<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateHomeAdvertisementsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('home_advertisements', function (Blueprint $table) {
            $table->increments('id');
            $table->unsignedInteger('type_id')->index();
            $table->string('image', 100)->nullable();
            $table->string('width')->index();
            $table->string('height')->index();
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
        Schema::dropIfExists('home_advertisements');
    }
}
