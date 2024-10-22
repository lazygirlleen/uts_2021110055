import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uts_2021110055/provider/cart_provider.dart';
import 'package:google_fonts/google_fonts.dart';

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
            Text(
              'Cart Items',
              style: GoogleFonts.josefinSans(
                    color: const Color.fromRGBO(0, 0, 0, 1),
                    fontSize: 22,
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
                  leading: Image.asset(
                    cartItem.product.imageUrl,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                    title: Text(cartItem.product.name),
                    subtitle: Text('Rp ${cartItem.product.price} x ${cartItem.quantity}'), // Memperbaiki format jumlah
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
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: SizedBox(
          height: 50.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Text(
              'Rp ${cartProvider.totalPrice.toString()}', // Total Price dari items
               style: GoogleFonts.josefinSans(
                  color: Colors.black,
                  fontSize: 25,
                  // fontWeight: FontWeight.bold,
                ),
            ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                onPressed: () {
                  // Tindakan checkout di sini
                  cartProvider.clearCart();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Succesfully Checkout Product!'),
                    ),
                  );
                },
                child: const Text('Checkout',
                 style: TextStyle(
                    fontSize: 12,
                    color: Colors.white, // Warna teks putih agar kontras
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
