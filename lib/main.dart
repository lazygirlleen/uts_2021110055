import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uts_2021110055/models/user.dart';
import 'package:uts_2021110055/provider/cart_provider.dart';
import 'package:uts_2021110055/provider/user_provider.dart';
import 'package:uts_2021110055/screens/home_screen.dart';
import 'package:uts_2021110055/screens/login_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

