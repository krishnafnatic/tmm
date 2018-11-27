<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateMenuItemsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('menu_items', function (Blueprint $table) {
            $table->increments('id');
            $table->unsignedInteger('menu_id')->index();
            $table->unsignedInteger('parent_id')->default('0');
            $table->string('title', 50)->index();
            $table->string('slug', 50)->index();
            $table->string('target', 20)->nullable();
            $table->string('icon_class', 20)->nullable();
            $table->tinyInteger('order')->default(0);
            $table->timestamps();
            $table->foreign('menu_id')
                  ->references('id')
                  ->on('menus')
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
        Schema::dropIfExists('menu_items');
    }
}
