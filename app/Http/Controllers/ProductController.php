<?php

namespace App\Http\Controllers;

use App\Models\Product;
use Illuminate\Http\Request;

class ProductController extends Controller
{
    public function index()
    {
        $prods = Product::get();

        if (request()->segment(1) == 'api') {
            return response()->json([
                'error' => false,
                'list'  => $prods,
            ]);
        }

        return view('view_product', [
            'title' => 'Daftar Produk',
            'data'  => $prods,
        ]);
    }

    public function create()
    {
        //
    }

    public function store(Request $request)
    {
        //
    }

    public function show(string $id)
    {
        //
    }

    public function edit(string $id)
    {
        //
    }

    public function update(Request $request, string $id)
    {
        //
    }

    public function destroy(string $id)
    {
        //
    }
}