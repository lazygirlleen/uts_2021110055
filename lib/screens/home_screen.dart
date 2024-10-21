import 'package:flutter/material.dart';
import 'package:uts_2021110055/models/product.dart';
import 'package:uts_2021110055/screens/cart_screen.dart';
import 'package:uts_2021110055/screens/feedback_screen.dart';
import 'package:uts_2021110055/screens/info_screen.dart';
import 'package:uts_2021110055/screens/product_screen.dart';

enum MainScreenItem { home, store, cart }

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  MainScreenItem _selectedItem = MainScreenItem.home;
  TextEditingController searchController = TextEditingController();
  String searchQuery = '';

  final List<Product> products = [
    Product(
      name: "Xiaomi 13T",
      price: 6499000,
      description: "Xiaomi 13T merupakan HP dengan layar 6.67 inchi",
      imageUrl: "images/xiaomi.jpeg",
    ),
    Product(
      name: "Samsung S24 FE",
      price: 9999000,
      description: "Desain ponsel ini terlihat premium dengan tiga kamera",
      imageUrl: "images/samsung.jpeg",
    ),
    Product(
      name: "Oppo A3 Pro 5G",
      price: 3999000,
      description: "OPPO A3 Pro 5G ideal untuk memenuhi kebutuhan hiburan",
      imageUrl: "images/oppo.jpeg",
    ),
    Product(
      name: "Oneplus 12R",
      price: 14899000,
      description: "Forever in our archive: Like Keqing’s echo",
      imageUrl: "images/oneplus.jpeg",
    ),
    Product(
      name: "Realme 13+ 5G",
      price: 4599000,
      description: "Performance Beyond Limits",
      imageUrl: "images/realme.jpeg",
    ),
    Product(
      name: "Infinix Smart 8 Pro",
      price: 1369000,
      description: "Abadikan foto dengan ketajaman yang tak tertandingi",
      imageUrl: "images/infinix.jpg",
    ),
  ];

  void _onItemTap(MainScreenItem item) {
    setState(() {
      _selectedItem = item;
    });
  }

  @override
  Widget build(BuildContext context) {
    final filteredProducts = products
        .where((product) => product.name.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();

    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 57, 58, 57),
              ),
              child: Text(
                'NekoShop',
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
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
        title: _selectedItem == MainScreenItem.home
            ? TextField(
                controller: searchController,
                decoration: const InputDecoration(
                  hintText: 'Search products...',
                  border: InputBorder.none,
                ),
                onChanged: (value) {
                  setState(() {
                    searchQuery = value;
                  });
                },
              )
            : Text(_selectedItem.name),
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
                itemCount: filteredProducts.length,
                itemBuilder: (context, index) {
                  final product = filteredProducts[index];
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
        child: const Icon(Icons.shopping_cart),
      ),
    );
  }

  Widget _buildProductBox(Product product, BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductScreen(product: product),
          ),
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
            Image.asset(
              product.imageUrl,
              height: 100,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 8),
            Text(product.name, style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
