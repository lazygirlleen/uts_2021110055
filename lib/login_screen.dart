import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: Container(
        color: const Color.fromARGB(255, 224, 242, 228), // Background warna hijau muda
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            
            children: [
              
              Text(
                'Welcome to Vegetables Order App',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 6, 116, 13),
                ),
              ),
              SizedBox(height: 20), // Spacer for better layout
             
            ],
          ),
        ),
      ),
    );
  }
}