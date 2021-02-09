<?php

/** @var \Illuminate\Database\Eloquent\Factory $factory */

use App\Models\ProductCategories;
use App\Models\Product;
use App\Models\Category;
use Faker\Generator as Faker;

$factory->define(ProductCategories::class, function (Faker $faker) {
    return [
        'category_id' => function (){
            return Category::all()->random();
        },
        'product_id' => function (){
            return Product::all()->random();
        },
    ];
});
