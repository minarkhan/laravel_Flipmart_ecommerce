<?php

namespace App\Http\Controllers\Admin;

use App\Models\Shipping;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class ShippingController extends Controller
{
    

	public function index(){

        
		$shippings = Shipping::all();
		$pageTitle = 'Shipping';
		$subTitle = 'List Shipping';
		return view('admin.shipping.index', compact('shippings', 'pageTitle', 'subTitle'));
	}

	public function create(){
		$pageTitle = 'Shipping';
		$subTitle = 'Create Shipping';
		return view('admin.shipping.create', compact('pageTitle', 'subTitle'));
	}


    public function store(Request $request){
    	// return $request->all();
        $this->validate($request, [
            'zone_name'      =>  'required|max:191',
            'zone_regions'      =>  'required|max:191',
            'method'      =>  'required|max:191',
            'price'      =>  'required|max:100',
            'status'      =>  'required|max:191'
        ]);

        $shipping = new Shipping;
        $shipping->zone_name = $request->zone_name;
        $shipping->zone_regions = $request->zone_regions;
        $shipping->method = $request->method;
        $shipping->price = $request->price;
        $shipping->status = $request->status;

        $shipping->save();
        return redirect()->route('admin.shippings.index');

        
    }

    public function delete($id){
        $shipping = Shipping::find($id);
        $shipping->delete();
        return $this->index();
    }


}
