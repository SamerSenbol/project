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

      //display edit product form
      public function editProductForm($id){
        $product = Product::find($id);
         return view('admin.editProductForm',['product'=>$product]);

    }


    //display edit product image form
    public function editProductImageForm($id){
        $product = Product::find($id);
        return view('admin.editProductImageForm',['product'=>$product]);
    }

    //update product Image
    public function updateProductImage(Request $request,$id){


      Validator::make($request->all(),['image'=>"required|file|image|mimes:jpg,png,jpeg|max:5000"])->validate();


      if($request->hasFile("image")){

          $product = Product::find($id);
        $exists = Storage::disk('local')->exists("public/product_images/".$product->image);

        //delete old image
        if($exists){
            Storage::delete('public/product_images/'.$product->image);

        }

        //upload new image
          $ext = $request->file('image')->getClientOriginalExtension(); //jpg

          $request->image->storeAs("public/product_images/",$product->image);

          $arrayToUpdate = array('image'=>$product->image);
          DB::table('products')->where('id',$id)->update($arrayToUpdate);


          return redirect()->route("adminDisplayProducts");

      }else{

          $error = "NO Image was Selected";
          return $error;

      }


  }

}
