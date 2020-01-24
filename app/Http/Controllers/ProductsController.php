<?php

namespace App\Http\Controllers;
use App\Product;
use Illuminate\Support\Facades\DB;

use Illuminate\Http\Request;

class ProductsController extends Controller
{
    //

    public function index(){
        /*
        $products =[0=>["name"=>"Iphone","category"=>"smart phones","price"=>1000],
                    1=>["name"=>"Galaxy","category"=>"smart phones","price"=>500],
                    2=>["name"=>"Sony","category"=>"smart phones","price"=>200]];
        */
        $products = Product::all();
        return view("allproducts",compact("products"));
    }


    public function addProductToCart(Request $request,$id){
        print_r($id);
    }
}
