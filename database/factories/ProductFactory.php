<?php

/** @var \Illuminate\Database\Eloquent\Factory $factory */

use App\Models\Product;
use App\Models\Brand;
use Faker\Generator as Faker;

$factory->define(Product::class, function (Faker $faker) {
    return [
        'brand_id'          =>  function(){
            return Brand::all()->random();},
        'sku'=> $faker->numberBetween(5000,6000),
        'name'=> $faker->name,
        'description'   =>  $faker->realText(100),
        'quantity'=> $faker->numberBetween(100,200),
        'weight'=> $faker->numberBetween(100,1000),
        'price'=> $faker->numberBetween(100,1000),
        'sale_price'=> $faker->numberBetween(50,800),
        'status'=> 1,
        'featured'=> 1,

    ];
});
