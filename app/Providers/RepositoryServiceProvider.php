<?php

namespace App\Providers;

use App\Contracts\CategoryContract;
use App\Contracts\SlideContract;
use Illuminate\Support\ServiceProvider;
use App\Repositories\CategoryRepository;
use App\Repositories\SlideRepository;
use App\Contracts\AttributeContract;
use App\Repositories\AttributeRepository;
use App\Contracts\BrandContract;
use App\Repositories\BrandRepository;
use App\Contracts\ProductContract;
use App\Repositories\ProductRepository;
use App\Contracts\OrderContract;
use App\Repositories\OrderRepository;

class RepositoryServiceProvider extends ServiceProvider
{
    protected $repositories = [
    CategoryContract::class         =>          CategoryRepository::class,
    SlideContract::class         =>          SlideRepository::class,
    AttributeContract::class        =>          AttributeRepository::class,
    BrandContract::class            =>          BrandRepository::class,
    ProductContract::class          =>          ProductRepository::class,
    OrderContract::class            =>          OrderRepository::class,
];

    /**
     * Register services.
     *
     * @return void
     */
    public function register()
    {
        foreach ($this->repositories as $interface => $implementation)
        {
            $this->app->bind($interface, $implementation);
        }
    }
}
