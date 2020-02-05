<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Product;

class AdminProductsController extends Controller
{
    //
      //display all products
      public function index(){
        $products = Product::paginate(3);
        return view("admin.displayProducts",['products'=>$products]);

    }
}
