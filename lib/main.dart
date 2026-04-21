import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'product.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

Future<List<Product>> fetchProduct() async {
  final response = await http.get(
    Uri.parse('http://192.168.18.135:8000/api/product'),
  );

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    final parsed = List<Map<String, dynamic>>.from(data['list']);
    return parsed.map((json) => Product.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load product');
  }
}

class _MyAppState extends State<MyApp> {
  late Future<List<Product>> products;

  @override
  void initState() {
    super.initState();
    products = fetchProduct();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Daftar Produk',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Daftar Produk'),
        ),
        body: FutureBuilder<List<Product>>(
          future: products,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            }

            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(
                child: Text(
                  'Tidak ada data',
                  style: TextStyle(fontSize: 20),
                ),
              );
            }

            final productList = snapshot.data!;

            return ListView.builder(
              itemCount: productList.length,
              itemBuilder: (context, index) {
                final item = productList[index];

                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  child: ListTile(
                    title: Text(
                      item.name,
                      style: const TextStyle(
                        color: Colors.blue,
                        fontSize: 24,
                      ),
                    ),
                    subtitle: Text(
                      item.price.toString(),
                      style: const TextStyle(
                        color: Colors.green,
                        fontSize: 20,
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}