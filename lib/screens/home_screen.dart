import 'package:flutter/material.dart';
import 'package:uts_2021110055/models/product.dart';
import 'package:uts_2021110055/screens/cart_screen.dart';
import 'package:uts_2021110055/screens/feedback_screen.dart';
import 'package:uts_2021110055/screens/info_screen.dart';
import 'package:uts_2021110055/screens/login_screen.dart';
import 'package:uts_2021110055/screens/product_screen.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';

enum MainScreenItem { home, store, cart }

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  MainScreenItem _selectedItem = MainScreenItem.home;
  final TextEditingController searchController = TextEditingController();
  String searchQuery = '';
  bool _isEditing = false;
  bool isSearching = false;


  final List<Product> products = [
    Product(
      name: "Xiaomi 13T",
      price: 6499000.00,
      description:
          "Xiaomi 13T merupakan HP dengan layar 6.67 inchi dan tingkat densitas piksel sebesar 446ppi. Ia dilengkapi dengan kamera belakang 50 + 50 + 12MP dan kamera depan 20MP. HP ini juga hadir dengan kapasitas baterai 5000mAh.",
      imageUrl: "images/xiaomi.jpeg",
    ),
    Product(
      name: "Samsung S24 FE",
      price: 9999000.00,
      description:
          "Desain ponsel ini terlihat premium dengan tiga kamera yang tersusun vertikal di bagian belakang dan layar datar dengan punch-hole kamera depan di bagian tengah atas. Meskipun menggunakan frame aluminium matte dan panel belakang glossy, kesan keseluruhannya tetap kokoh dan tahan lama berkat sertifikasi IP68 untuk ketahanan air dan debu.",
      imageUrl: "images/samsung.jpeg",
    ),
    Product(
      name: "Oppo A3 Pro 5G",
      price: 3999000.00,
      description:
          "OPPO A3 Pro 5G ideal untuk memenuhi kebutuhan hiburan, termaksud bermain game",
      imageUrl: "images/oppo.jpeg",
    ),
    Product(
      name: "Oneplus 12R",
      price: 14899000.00,
      description: "Forever in our archive: Like Keqing’s echo, this product won’t return.",
      imageUrl: "images/oneplus.jpeg",
    ),
    Product(
      name: "Realme 13+ 5G",
      price: 4599000.00,
      description:
          "Realme 13 Plus 5G memiliki tuning khusus untuk gaming tingkat turnamen. 'Performance Beyond Limits' Realme 13 Series 5G siap menjadi pilihan mereka yang mengutamakan performa didampingi dengan desain stylish dan kemampuan fotografi mumpuni",
      imageUrl: "images/realme.jpeg",
    ),
    Product(
      name: "Infinix Smart 8 Pro",
      price: 1369000.00,
      description:
          "Infinix Smart 8 Pro hadir dengan konsep desain ‘mewah’ untuk ukuran smartphone sejuta. Bodinya dibalut dengan material plastik polikarbonat yang ringan.",
      imageUrl: "images/infinix.jpg",
    ),
    Product(
      name: "Samsung A35 5G",
      price: 4990000.00,
      description:
          "Samsung Galaxy A35 5G hadir dengan layar Super AMOLED berukuran 6,6 inci, dengan resolusi Full HD Plus (1.080 x 2.340 piksel), refresh rate 120 Hz, kedalaman warna 16 juta, rasio layar 19,5:9, dan tingkat kecerahan (brightness) maksimum 1.000 nits.",
      imageUrl: "images/samsunga35.jpeg",
    ),
     Product(
      name: "Oneplus Ace Pro",
      price: 24350000.00,
      description: "OnePlus Ace Pro Genshin Impact Limited Edition dirancang dengan antamuka khusus yang mampu menampilkan animasi booting, membuka kunci, lockscreen, serta live wallpaper bertema Hu Tao.",
      imageUrl: "images/oneplushutao.jpeg",
    ),
  ];

  final NumberFormat currencyFormatter =
      NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ');

  void _onItemTap(MainScreenItem item) {
    setState(() {
      _selectedItem = item;
    });
  }

  @override
  Widget build(BuildContext context) {
    final filteredProducts = products
        .where((product) =>
            product.name.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();

    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 57, 58, 57),
              ),
              child: Text(
                'NekoShop',
                style: GoogleFonts.josefinSans(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: Text('About', style: GoogleFonts.josefinSans()),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const InfoScreen()),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.border_color),
              title: Text('Feedback', style: GoogleFonts.josefinSans()),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FeedbackScreen()),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: Text('Logout', style: GoogleFonts.josefinSans()),
              onTap: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: _selectedItem == MainScreenItem.home
            ? _isEditing
                ? Expanded(
                    child: TextField(
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
                    ),
                  )
                : Text(
                    searchQuery.isNotEmpty ? searchQuery : 'Search products...',
                    style: GoogleFonts.josefinSans(fontSize: 16),
                  )
            : const SizedBox(),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              setState(() {
                _isEditing = !_isEditing;
                if (!_isEditing) {
                  searchQuery = searchController.text;
                  searchController.clear();
                }
              });
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Our Products',
              style: GoogleFonts.josefinSans(
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
                  return _buildProductBox(product);
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

  Widget _buildProductBox(Product product) {
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
            Text(
              product.name,
              style: GoogleFonts.josefinSans(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
