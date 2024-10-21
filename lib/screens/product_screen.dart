import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uts_2021110055/models/product.dart';
import 'package:uts_2021110055/provider/cart_provider.dart';
import 'package:input_quantity/input_quantity.dart';

class ProductScreen extends StatefulWidget {
  final Product product;

  const ProductScreen({super.key, required this.product});

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              widget.product.imageUrl,
              height: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16),
            Text(
              widget.product.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
                'Rp ${widget.product.price.toString()}', // Mengubah mata uang ke Rp.
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            const SizedBox(height: 8),
            Text(
              widget.product.description,
              style: const TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            InputQty(
              maxVal: 10,
              initVal: 1,
              minVal: 1,
              steps: 1,
              onQtyChanged: (val) {
                setState(() {
                  quantity = val.toInt();
                });
              },
            ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                onPressed: () {
                  final cartProvider = Provider.of<CartProvider>(context, listen: false);
                  cartProvider.addProduct(widget.product, quantity);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Added to cart'),
                    ),
                  );
                },
                child: const Text('Add to Cart'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
