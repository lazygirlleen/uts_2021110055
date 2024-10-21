import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uts_2021110055/provider/cart_provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final cartItems = cartProvider.cartItems;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Cart Items',
              style: TextStyle(
                color: Colors.black,
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  final cartItem = cartItems[index];
                  return ListTile(
                    title: Text(cartItem.product.name),
                    subtitle: Text('Quantity: ${cartItem.quantity}'), // Memperbaiki format jumlah
                    trailing: Text('Total: Rp ${cartItem.totalPrice.toString()}'), // Mengubah format total price
                    onTap: () {
                      cartProvider.decreaseQuantity(cartItem.product);
                    },
                    onLongPress: () {
                      cartProvider.removeProduct(cartItem.product);
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
              'Total Price: Rp ${cartProvider.totalPrice.toString()}', // Mengubah format total price
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: SizedBox(
          height: 50.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                onPressed: () {
                  // Tindakan checkout di sini
                  cartProvider.clearCart();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Checkout clicked!'),
                    ),
                  );
                },
                child: const Text('Checkout'),
              ),
              const SizedBox(width: 16),
            ],
          ),
        ),
      ),
    );
  }
}
