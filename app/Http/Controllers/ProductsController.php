<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class ProductsController extends Controller
{
    //

    public function index(){
        $products =[0=>["name"=>"Iphone","category"=>"smart phones","price"=>1000],
                    1=>["name"=>"Galaxy","category"=>"smart phones","price"=>500],
                    2=>["name"=>"Sony","category"=>"smart phones","price"=>200]];
        return view("allproducts",compact("products"));
    }
}
