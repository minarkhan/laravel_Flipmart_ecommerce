<?php

/** @var \Illuminate\Database\Eloquent\Factory $factory */

use App\Models\ProductImage;
use App\Models\Product;
use Faker\Generator as Faker;

$factory->define(ProductImage::class, function (Faker $faker) {
    return [
        'product_id' => function (){
            return Product::all()->random();
        },
        'full' => 'products/'.$faker->numberBetween(1,20). '.jpg',
    ];
});
