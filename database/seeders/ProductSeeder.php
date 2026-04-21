<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Product;

class ProductSeeder extends Seeder
{
    public function run(): void
    {
        Product::create([
            'name' => 'HP Spectre',
            'price' => 25000000,
        ]);

        Product::create([
            'name' => 'Acer Nitro',
            'price' => 15000000,
        ]);

        Product::create([
            'name' => 'Asus ROG',
            'price' => 15000000,
        ]);
    }
}