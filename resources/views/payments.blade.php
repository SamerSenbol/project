
@extends('layouts.index')



@section('center')

<form method="post" action="https://sandbox.paypal.com/cgi-bin/webscr">

<section id="do_action">
    <div class="container">
        <div class="heading">
            <h3>What would you like to do next?</h3>
            <p>Choose if you have a discount code or reward points you want to use or would like to estimate your delivery cost.</p>
        </div>
        <div class="row">

            <div class="col-sm-6 col-md-offset-3">
                <div class="chose_area">
                    <ul class="user_info">
                        <li class="single_field">
                            <label>Name:</label>
                            <input type="text" name="name" value="{{$cart->name}}" required="required">
                        </li>
                        <li class="single_field">
                            <label>Email:</label>
                            <input type="email" name="email" value="{{$cart->email}}" required="required">
                        </li>
                        <li class="single_field zip-field">
                            <label>Total Amount:</label>
                            <input type="text" name="zip_code" value="{{$cart->price}}" required="required">
                        </li>
                    </ul>
                
                   
                    <input type="hidden" name="cmd" value="_xclick">
                    <input type="hidden" name="business" value="snintegratedsolutions@gmail.com">
                    <input type="hidden" name="currency_code" value="USD">
                    <input type="hidden" name="item_name" value="{{$cart->name}}">
                    <input type="hidden" name="no_shipping" value="1">
                    <input type="hidden" name="amount" value="{{$cart->price}}">
                    <input type="image" src="{{asset('images/paypalcheckout.png')}}" border="0" name="submit" alt="Make payments with PayPal - it's fast, free and secure!" style="width: 200px;float: right;">

                     <input type = "hidden" name = "_token" value = "<?php echo csrf_token(); ?>"> 
                    <div style="clear: both;height: 2px"></div>
                </div>
            </div>
        </div>
    </div>
</section><!--/#do_action-->
</form>


@endsection


