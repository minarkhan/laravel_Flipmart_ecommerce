
<!-- ============================================== HEADER ============================================== -->
<header class="header-style-1">
  <!-- ============================================== TOP MENU ============================================== -->
  <div class="top-bar animate-dropdown">
    <div class="container">
      <div class="header-top-inner">
        <div class="cnt-account">
          <ul class="list-unstyled">
            <li><a href="{{ route('checkout.cart') }}"><i class="icon fa fa-heart"></i>Wishlist</a></li>
            <li><a href="{{ route('checkout.cart') }}"><i class="icon fa fa-shopping-cart"></i>My Cart</a></li>
            <li><a href="{{ route('checkout.cart') }}"><i class="icon fa fa-check"></i>Checkout</a></li>

            @guest

            <li>
                <a href="{{ route('login') }}"><i class="icon fa fa-lock"></i>Login</a>
            </li>

            <li>
                <a href="{{ route('register') }}"><i class="icon fa fa-lock"></i>Register</a>
            </li>

            @else
            <!-- <li>
                <ul class="navbar-nav ml-auto"> -->
                    <li class="nav-item dropdown">
                        <a id="navbarDropdown" class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" v-pre>
                            {{ Auth::user()->full_name }}<span class="caret"></span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item bg-primary" href="{{ route('logout') }}"
                               onclick="event.preventDefault();
                                         document.getElementById('logout-form').submit();">
                                {{ __('Logout') }}
                            </a>
                            <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                                @csrf
                            </form>
                        </div>
                    </li>
                <!-- </ul>
                </li> -->
            @endguest
            </li>
          </ul>
        </div>
        <!-- /.cnt-account -->

        <div class="cnt-block">
          <ul class="list-unstyled list-inline">
            <li class="dropdown dropdown-small"> <a href="#" class="dropdown-toggle" data-hover="dropdown" data-toggle="dropdown"><span class="value">USD </span><b class="caret"></b></a>
              <ul class="dropdown-menu">
                <li><a href="#">USD</a></li>
                <li><a href="#">INR</a></li>
                <li><a href="#">GBP</a></li>
              </ul>
            </li>
            <li class="dropdown dropdown-small"> <a href="#" class="dropdown-toggle" data-hover="dropdown" data-toggle="dropdown"><span class="value">English </span><b class="caret"></b></a>
              <ul class="dropdown-menu">
                <li><a href="#">English</a></li>
                <li><a href="#">French</a></li>
                <li><a href="#">German</a></li>
              </ul>
            </li>
          </ul>
          <!-- /.list-unstyled -->
        </div>
        <!-- /.cnt-cart -->
        <div class="clearfix"></div>
      </div>
      <!-- /.header-top-inner -->
    </div>
    <!-- /.container -->
  </div>
  <!-- /.header-top -->
  <!-- ============================================== TOP MENU : END ============================================== -->
  <div class="main-header">
    <div class="container">
      <div class="row">
        <div class="col-xs-12 col-sm-12 col-md-3 logo-holder">
          <!-- ============================================================= LOGO ============================================================= -->
           <div class="logo">
                <a href="{{ url('/') }}">
                    <img class="logo" src="{{asset('assets/website')}}/images/logo.png" alt="logo">
                </a>
            </div>

          <!-- /.logo -->
          <!-- ============================================================= LOGO : END ============================================================= --> </div>
        <!-- /.logo-holder -->

        <div class="col-xs-12 col-sm-12 col-md-7 top-search-holder">
          <!-- /.contact-row -->
          <!-- ============================================================= SEARCH AREA ============================================================= -->
          <div class="search-area">
            <form action="{{Route('search')}}" method="GET">
                {{-- @csrf --}}
              <div class="control-group">
                <ul class="categories-filter animate-dropdown">
                  <li class="dropdown"> <a class="dropdown-toggle"  data-toggle="dropdown" href="category.html">Categories <b class="caret"></b></a>
                    <ul class="dropdown-menu" role="menu" >


                            @foreach($categories as $cat)
                                @foreach($cat->items as $category)
                                    @if ($category->items->count() > 0)
                                <li class="menu-header">{{ $category->name }}</li>
                                @foreach($category->items as $item)
                                    <li role="presentation"><a role="menuitem" tabindex="-1" href="{{ route('category.show', $item->slug) }}">- {{ $item->name }}</a></li>
                            @endforeach
                            {{-- @else
                                <li class="menu-header">{{ $category->name }}</li> --}}
                            @endif
                            @endforeach
                            @endforeach



                    </ul>
                  </li>
                </ul>
                <input class="search-field"  value="{{ request()->input('query')}}" name="query" id="query" placeholder="Search here..." />
                <input type="submit" class="search-button" value="Search">
                {{-- <a class="search-button" href="#" ></a>  --}}
            </div>
            </form>
          </div>
          <!-- /.search-area -->
          <!-- ============================================================= SEARCH AREA : END ============================================================= --> </div>
        <!-- /.top-search-holder -->

        <div class="col-xs-12 col-sm-12 col-md-2 animate-dropdown top-cart-row">
          <!-- ============================================================= SHOPPING CART DROPDOWN ============================================================= -->

          <div class="dropdown dropdown-cart"> <a href="#" class="dropdown-toggle lnk-cart" data-toggle="dropdown">
            <div class="items-cart-inner">
              <div class="basket"> <i class="glyphicon glyphicon-shopping-cart"></i> </div>
              <div class="basket-item-count"><span class="count">{{ $cartCount }}</span></div>

              <div class="total-price-basket"> <span class="lbl">cart -</span> <span class="total-price"> <span class="sign">$</span><span class="value">{{ $cartTotal }}</span> </span> </div>
            </div>

            </a>
            <ul class="dropdown-menu">




                <li>
                @foreach ($items as $item)
                  <div class="cart-item product-summary">
                    <div class="row">
                      <div class="col-xs-4">
                        <?php $i =1; ?>
                        @foreach ($productImgs as $image)
                        @if($image->product_id == $item->id && $i == 1)
                          <div class="image">
                            <a href="{{ route('checkout.cart') }}"><img src="{{ asset('storage/'.$image->full) }}" alt=""></a>
                          </div>
                          <?php $i++; ?>
                        @endif
                        @endforeach
                      </div>
                      <div class="col-xs-7">
                        <h3 class="name"><a href="{{ route('checkout.cart') }}">{{$item->name}}</a></h3>
                    <div style="font-size: 10px;" class="price">{{$item->price}}x{{$item->quantity}} = {{$item->price*$item->quantity}}</div>
                      </div>
                      <div class="col-xs-1 action">
                        <a href="{{ route('checkout.cart.remove', $item->id) }}" class=""><i class="fa fa-trash"></i> </a>
                     </div>
                    </div>
                  </div>
                  <!-- /.cart-item -->
                @endforeach

                  <div class="clearfix"></div>
                  <hr>
                  <div class="clearfix cart-total">
                    <div class="pull-right"> <span class="text">Sub Total :</span><span class='price'>{{ $cartTotal }}</span> </div>
                    <div class="clearfix"></div>
                    <a href="{{ route('checkout.cart') }}" class="btn btn-upper btn-primary btn-block m-t-20">Checkout</a>
                  </div>
                  <!-- /.cart-total-->
                </li>




            </ul>
            <!-- /.dropdown-menu-->
          </div>
          <!-- /.dropdown-cart -->

          <!-- ============================================================= SHOPPING CART DROPDOWN : END============================================================= --> </div>
        <!-- /.top-cart-row -->
      </div>
      <!-- /.row -->

    </div>
    <!-- /.container -->

  </div>
  <!-- /.main-header -->

  @include('site.partials.nav')
</header>
