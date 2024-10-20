import 'package:flutter/material.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
   

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'About',
          style: TextStyle(
            color: Colors.black,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: const Padding(
        padding:  EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
      SizedBox(height: 16),
      Text('Halo, Selamat datang di Nekoshop!',
       style: TextStyle(
                    fontSize: 16,
                    color: Color.fromARGB(255, 106, 106, 106),
                    fontWeight: FontWeight.bold,
                  ),
                  ),
      SizedBox(height: 16),
      Text('Kami merupakan sebuah E-Commerce yang menjual berbagai jenis Smartphone',
       style: TextStyle(
                    fontSize: 14,
                    color: Color.fromARGB(255, 106, 106, 106),
                  ),
                  ),
      SizedBox(height: 16),
       Text('Code by Sulistiani',
       style: TextStyle(
                    fontSize: 14,
                    color: Color.fromARGB(255, 106, 106, 106),
                  ),
                  ),
      Text('Logo created by Sulistiani',
       style: TextStyle(
                    fontSize: 14,
                    color:Color.fromARGB(255, 106, 106, 106),
                  ),
                  )
          ],
        ),
      ),
      
    );
  }

 
}