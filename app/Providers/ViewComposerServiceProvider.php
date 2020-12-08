<?php

namespace App\Providers;

use App\Models\ProductImage;
use App\Models\Category;
use Illuminate\Support\Facades\View;
use Illuminate\Support\ServiceProvider;
use Cart;
class ViewComposerServiceProvider extends ServiceProvider
{
    /**
     * Bootstrap services.
     *
     * @return void
     */
    public function boot()
    {
        View::composer('site.partials.nav', function ($view) {
            $view->with('categories', Category::orderByRaw('-name ASC')->get()->nest());
        });

        View::composer('site.partials.sidebar', function ($view) {
            $view->with('categories', Category::orderByRaw('-name ASC')->get()->nest());
        });

        View::composer('site.partials.header', function ($view) {

            $productImgs = ProductImage::all();
            $items = Cart::getContent();
            $cartTotal = Cart::getSubTotal();
            $cartCount = Cart::getContent()->count();
            $view
                ->with('cartTotal', $cartTotal)
                ->with('cartCount', $cartCount)
                ->with('items', $items)
                ->with('productImgs', $productImgs);
        });
    }
}