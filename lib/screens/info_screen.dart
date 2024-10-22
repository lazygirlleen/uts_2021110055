import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
   

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'About',
           style: GoogleFonts.josefinSans(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
      const SizedBox(height: 16),
      Text(
        'Halo, Selamat datang di Nekoshop!',
       style: GoogleFonts.josefinSans(
                fontWeight: FontWeight.bold,
                fontSize: 20,
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