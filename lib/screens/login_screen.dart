import 'package:flutter/material.dart';
import 'package:uts_2021110055/provider/user_provider.dart';
import 'package:uts_2021110055/screens/home_screen.dart';
import 'package:uts_2021110055/models/user.dart'; 
import 'package:provider/provider.dart';
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    // Check if there's an existing user for editing
    final existingUser = ModalRoute.of(context)?.settings.arguments as User?;
    final isEdit = existingUser != null;

    // Pre-fill fields if editing an existing user
    if (isEdit) {
      emailController.text = existingUser.email;
      passwordController.text = existingUser.password;
    }

    return Scaffold(
      appBar: AppBar(
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
              SizedBox(
              child: Image.asset(
                'images/Nekoshop.png',
                fit: BoxFit.contain, 
              ),
            ),
                const SizedBox(height: 20.0),
            const Text(
              'Welcome to Nekoshop',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 20),
         
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
              ),
            ),
            const SizedBox(height: 16),
           
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                final email = emailController.text.trim();
                final password = passwordController.text.trim();

                // Simple validation
                if (email.isEmpty || password.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please fill in all fields')),
                  );
                  return;
                }

                final newUser = User(
                  email: email,
                  password: password,
                );

                if(isEdit){
                      context.read<UserProvider>().editUser(newUser);
                    } else {
                      context.read<UserProvider>().addUser(newUser);
                    }
                    
                    context.read<UserProvider>().addUser(newUser);

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
              },
              child: Text(isEdit ? 'Update' : 'Login'),
            ),
          ],
        ),
      ),
    );
  }
}
