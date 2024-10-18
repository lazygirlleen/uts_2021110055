import 'package:flutter/material.dart';
import 'package:uts_2021110055/info_screen.dart';


enum MainScreenItem { home, store, cart } // Enum for navigation items

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  MainScreenItem _selectedItem = MainScreenItem.home;


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
                'Vegetables Order App',
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
            ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text('Logout'),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const WelcomeScreen()),
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
              child: const CircleAvatar(
                backgroundImage: AssetImage('assets/images/avatar.png'), // Avatar Image
              ),
            ),
          ),
        ],
      ),
      body: _widgetOptions[_selectedItem.index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedItem.index,
        onTap: (index) => _onItemTap(MainScreenItem.values[index]),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.storefront),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long),
            label: 'Store',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
        ],
      ),
    );
  }
}