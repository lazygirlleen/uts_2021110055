import 'package:flutter/material.dart';
import 'package:uts_2021110055/cart_screen.dart';
import 'package:uts_2021110055/feedback_screen.dart';
import 'package:uts_2021110055/info_screen.dart';
import 'package:uts_2021110055/product_screen.dart';

// Enum for navigation items
enum MainScreenItem { home, store, cart }

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  MainScreenItem _selectedItem = MainScreenItem.home;

  final List<Map<String, String>> products = [
    {"name": "Permen", "description": "This is product 1 description."},
    {"name": "Product 2", "description": "This is product 2 description."},
    {"name": "Product 3", "description": "This is product 3 description."},
    {"name": "Product 4", "description": "This is product 4 description."},
    {"name": "Product 5", "description": "This is product 5 description."},
    {"name": "Product 6", "description": "This is product 6 description."},
  ];

  void _onItemTap(MainScreenItem item) {
    setState(() {
      _selectedItem = item;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 209, 255, 207),
              ),
              child: Text(
                'NekoShop',
                style: TextStyle(
                  color: Color.fromARGB(255, 57, 58, 57),
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('About'),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const InfoScreen()),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.border_color),
              title: const Text('Feedback'),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FeedbackScreen()),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(
          _selectedItem == MainScreenItem.home ? 'Home' : _selectedItem.name,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: InkWell(
              onTap: () {
                Navigator.pushReplacementNamed(context, '/manageAccount');
              },
              child: IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  // Add search action
                },
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Our Products',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                  childAspectRatio: 1,
                ),
                itemCount: products.length, // Dynamically setting the item count
                itemBuilder: (context, index) {
                  final product = products[index];
                  return _buildProductBox(product, context);
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CartScreen()),
          );
        },
        tooltip: 'Open shopping cart',
        child: const Icon(Icons.shopping_cart),
      ),
    );
  }

  Widget _buildProductBox(Map<String, String> product, BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
         MaterialPageRoute(builder: (context) => const ProductScreen()),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.image, size: 50, color: Colors.grey),
            const SizedBox(height: 8),
            Text(product['name']!, style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
