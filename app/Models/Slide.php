<?php

namespace App\Models;

use Illuminate\Support\Str;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Brand
 * @package App\Models
 */
class Slide extends Model
{
    /**
     * @var string
     */
    protected $table = 'Slides';

    /**
     * @var array
     */
    protected $fillable = ['title', 'sub_title', 'description', 'button_text', 'button_link', 'image'];

    /**
     * @param $value
     */
    public function setNameAttribute($value)
    {
        $this->attributes['name'] = $value;
        $this->attributes['slug'] = Str::slug($value);
    }
}