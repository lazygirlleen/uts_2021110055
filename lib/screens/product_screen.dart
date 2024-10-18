import 'package:flutter/material.dart';
import 'package:uts_2021110055/screens/cart_screen.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
   

    return Scaffold(
      appBar: AppBar(
  
      ),
      body: const Padding(
        padding:  EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          
          ],
        ),
      ),
        bottomNavigationBar: BottomAppBar(
        child: SizedBox(
          height: 30.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () {
               MaterialPageRoute(builder: (context) => const CartScreen()
               );
              },
                child: const Text('Add to Cart'),
              )
              ],
            ),
        ),
      ),
    );
  }

}