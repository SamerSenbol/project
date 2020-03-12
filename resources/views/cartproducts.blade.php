
@extends('layouts.index')



@section('center')

<form method="post" action="{{ route('saveorder') }}">
<section id="cart_items">
    <div class="container">
        <div class="breadcrumbs">
            <ol class="breadcrumb">
                <li><a href="#">Home</a></li>
                <li class="active">Shopping Cart</li>
            </ol>
        </div>

        <div class="table-responsive cart_info">
             @if (session('status'))
                                        <div class="alert alert-success">
                                            {{ session('status') }}
                                        </div>
                                    @endif
                
            <table class="table table-condensed">
                <thead>



                <tr class="cart_menu">
                    <td class="image">Item</td>
                    <td class="description"></td>
                    <td class="price">Price</td>
                    <td class="quantity">Quantity</td>
                    <td class="total">Total</td>
                    <td></td>
                </tr>
                </thead>
                <tbody>

                <?php $newtotal  = 0;?>
                @foreach($cartItems as $item)


                <tr>
                    <td class="cart_product">
                        <a href=""><img src="{{Storage::disk('local')->url('product_images/'.$item->image)}}"  width="100" height="100"alt=""></a>
                    </td>
                    <td class="cart_description">
                        <h4><a href="">{{$item->name}}</a></h4>
                        <p>{{$item->description}} - {{$item->type}} </p>
                        <p> id: {{$item->id}}</p>
                    </td>
                    <td class="cart_price">
                        <p>{{$item->price}}</p>
                    </td>
                    <td class="cart_quantity">
                        <div class="cart_quantity_button">
                            <!-- <a class="cart_quantity_up" href="{{ route('IncreaseSingleProduct',['id' => $item->id]) }}"> + </a> -->
                            <input class="cart_quantity_input" id="{{$item->id}}" data="{{str_replace('Kr ','', $item->price)}}" type="number" name="quantity[{{$item->id}}]" value="1" autocomplete="off" size="2">
                            <!-- <a class="cart_quantity_down" href="{{ route('DecreaseSingleProduct',['id' => $item->id]) }}"> - </a> -->
                        </div>
                    </td>
                    <td class="cart_total">
                        <input type="hidden" name="price_total[{{$item->id}}]" 
                        value="{{str_replace('Kr ','', $item->price)}}" class="amount_total p{{$item->id}}">
                        <input type="hidden" name="ids[]" 
                        value="{{$item->id}}" >
                        <p class="cart_total_price {{$item->id}}">{{$item->price}}</p>
                    </td>
                    <td class="cart_delete">
                        <a class="cart_quantity_delete" href="{{ route('DeleteItemFromCart',['id' => $item->id]) }}"><i class="fa fa-times"></i></a>
                    </td>
                </tr>

                @endforeach



                </tbody>
            </table>
        </div>
    </div>
</section> <!--/#cart_items-->

<section id="do_action">
    <div class="container">
        <div class="heading">
            <h3>What would you like to do next?</h3>
            <p>Choose if you have a discount code or reward points you want to use or would like to estimate your delivery cost.</p>
        </div>
        <div class="row">
            <div class="col-sm-6">
                <div class="chose_area">
                    <!-- <ul class="user_option">
                        <li>
                            <input type="checkbox">
                            <label>Use Coupon Code</label>
                        </li>
                        <li>
                            <input type="checkbox">
                            <label>Use Gift Voucher</label>
                        </li>
                        <li>
                            <input type="checkbox">
                            <label>Estimate Shipping & Taxes</label>
                        </li>
                    </ul> -->
                    <ul class="user_info">
                        <li class="single_field">
                            <label>Name:</label>
                            <input type="text" name="name" value="" required="required">
                        </li>
                        <li class="single_field">
                            <label>Email:</label>
                            <input type="email" name="email" value="" required="required">
                        </li>
                        <li class="single_field zip-field">
                            <label>Zip Code:</label>
                            <input type="text" name="zip_code" required="required">
                        </li>
                    </ul>
                     <ul class="user_info">
                        <li >
                            <label>Phone:</label>
                            <input type="text" name="phone" value="" required="required">
                        </li>
                        <li style="width: 60%;">
                            <label>Address:</label>
                            <input type="text" name="address" value=""  required="required">
                        </li>
                        
                    </ul>
                </div>
            </div>
            <div class="col-sm-6">
                <div class="total_area">
                    <ul>

                        <li>Quantity<span id="display_total_quantity"></span></li>
                        <li>Shipping Cost <span>Free</span></li>
                        <li>Total <span id="display_total_amount"><?= $newtotal; ?></span></li>
                    </ul>
                    <input type="submit" name="checkout" value="Checkout" class="btn btn-default check_out" style="float: right;">
                    <input type="hidden" name="display_total_amount" id="display_total_amount_val">
                     <input type = "hidden" name = "_token" value = "<?php echo csrf_token(); ?>"> 
                    <div style="clear: both;height: 2px"></div>
                </div>
            </div>
        </div>
    </div>
</section><!--/#do_action-->
</form>


@endsection


