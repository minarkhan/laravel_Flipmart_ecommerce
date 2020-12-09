

 <!-- ============================================== UPSELL PRODUCTS ============================================== -->
                    <section class="section featured-product wow fadeInUp">
                        <h3 class="section-title">upsell products</h3>
                        <div class="owl-carousel home-owl-carousel upsell-product custom-carousel owl-theme outer-top-xs">






                             @foreach($products as $product)
                  <div class="item item-carousel">
                    <div class="products">
                      <div class="product">

                        <div class="product-image">
                            @if ($product->images->count() > 0)

                            <div class="image">
                                <a href="{{ route('product.show', $product->slug) }}"><img src="{{ asset('storage/'.$product->images->first()->full) }}" alt=""></a>
                            </div>
                            <!-- /.image -->
                            @else

                            <div class="image">
                                <a href="{{ route('product.show', $product->slug) }}"><img src="https://via.placeholder.com/176" alt=""></a>
                                <!-- /.image -->
                            </div>

                               @endif
                            <div class="tag new"><span>new</span></div>
                        </div>
                        <!-- /.product-image -->
                        
                        <div class="product-info text-left">
                          <h3 class="name"><a href="{{ route('product.show', $product->slug) }}">{{ $product->name }}</a></h3>
                          <div class="rating rateit-small"></div>
                          <div class="description"></div>


                          @if ($product->sale_price != 0)
                              <div class="product-price">
                                  <span class="price"> {{ config('settings.currency_symbol').$product->sale_price }} </span>
                                  <del class="price-before-discount"> {{ config('settings.currency_symbol').$product->price }}</del>
                              </div>
                          @else
                              <div class="product-price">
                                  <span class="price"> {{ config('settings.currency_symbol').$product->price }} </span>
                              </div>
                           @endif
                          <!-- /.product-price --> 
                          
                        </div>
                        <!-- /.product-info -->
                        <div class="cart clearfix animate-effect">
                          <div class="action">
                            <ul class="list-unstyled">
                              <li class="add-cart-button btn-group">
                                  <a href="{{ route('product.show', $product->slug) }}">
                                      <button data-toggle="tooltip" class="btn btn-primary icon" type="button" title="Add Cart"> <i class="fa fa-shopping-cart"></i> </button>
                                      <button class="btn btn-primary cart-btn" type="button">Add to cart</button>
                                  </a>
                              </li>
                              <li class="lnk wishlist"> <a data-toggle="tooltip" class="add-to-cart" href="detail.html" title="Wishlist"> <i class="icon fa fa-heart"></i> </a> </li>
                              <li class="lnk"> <a data-toggle="tooltip" class="add-to-cart" href="detail.html" title="Compare"> <i class="fa fa-signal" aria-hidden="true"></i> </a> </li>
                            </ul>
                          </div>
                          <!-- /.action --> 
                        </div>
                        <!-- /.cart --> 
                      </div>
                      <!-- /.product --> 
                      
                    </div>
                    <!-- /.products --> 
                  </div>
                  <!-- /.item -->
                 
                  @endforeach
                  <!-- /.item --> 

                        </div><!-- /.home-owl-carousel -->
                    </section><!-- /.section -->
                    <!-- ============================================== UPSELL PRODUCTS : END ============================================== -->