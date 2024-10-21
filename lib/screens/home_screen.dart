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

  final List<Product> products = [
    Product(
      name: "Xiaomi 13T",
      description:
      "Xiaomi 13T merupakan HP dengan layar 6.67 inchi dan tingkat densitas piksel sebesar 446ppi. Ia dilengkapi dengan kamera belakang 50 + 50 + 12MP dan kamera depan 20MP. HP ini juga hadir dengan kapasitas baterai 5000mAh.",
      imageUrl: "images/xiaomi.jpeg",
    ),
    Product(
      name: "Samsung  S24 FE", 
      description: "Desain ponsel ini terlihat premium dengan tiga kamera yang tersusun vertikal di bagian belakang dan layar datar dengan punch-hole kamera depan di bagian tengah atas. Meskipun menggunakan frame aluminium matte dan panel belakang glossy, kesan keseluruhannya tetap kokoh dan tahan lama berkat sertifikasi IP68 untuk ketahanan air dan debu.", 
      imageUrl: "images/samsung.jpeg"
    ),
    Product(
      name: "Oppo A3 Pro 5G", 
      description: "OPPO A3 Pro 5G ideal untuk memenuhi kebutuhan hiburan, termasuk bermain game.", 
      imageUrl: "images/oppo.jpeg"
    ),
    Product(
      name: "Oneplus 12R", 
      description: "Forever in our archive: Like Keqing’s echo, this product won’t return.", 
      imageUrl: "images/oneplus.jpeg"
    ),
    Product(
      name: "Realme 13+ 5G", 
      description: "Performance Beyond Limits", 
      imageUrl: "images/realme.jpeg"),
    Product(
      name: "Infinix Smart 8 Pro", 
      description: "Abadikan foto dengan ketajaman yang tak tertandingi dengan kamera 50MP Dual AI Camera", 
      imageUrl: "images/infinix.jpg"
    ),
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
        title: Text(_selectedItem == MainScreenItem.home ? 'Home' : _selectedItem.name),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: InkWell(
              onTap: () {
                Navigator.pushReplacementNamed(context, '/manageAccount');
              },
              child: IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {},
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
                itemCount: products.length,
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
          builder: (context) => ProductScreen(product: product), // Kirim data produk ke ProductScreen
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
