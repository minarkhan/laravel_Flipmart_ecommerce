<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Shipping extends Model
{
    protected $fillable = [

    	'zone_name',
    	'zone_regions',
    	'method',
    	'price',
    	'status'
    ];
}
