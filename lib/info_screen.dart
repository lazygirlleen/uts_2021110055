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
      Text('Halo, selamat datang di Vegetables Order App!',
       style: TextStyle(
                    fontSize: 16,
                    color: Color.fromARGB(255, 98, 134, 100),
                    fontWeight: FontWeight.bold,
                  ),),

      SizedBox(height: 10),
      Text('Dapatkan berbagai macam sayuran segar, mulai dari sayuran hijau, umbi-umbian, hingga buah-buahan, hanya dengan satu kali klik! Semua sayuran kami dipasok langsung dari petani lokal, sehingga Anda bisa yakin akan kesegarannya.',
       style: TextStyle(
                    fontSize: 14,
                    color: Color.fromARGB(255, 98, 134, 100)
                  ),),

       SizedBox(height: 10),
       Text('Nikmati kemudahan memilih, membayar, dan melacak pesanan anda. Sembari mendukung petani lokal dan konsumsi sayur segar setiap hari. Unduh sekarang dan rasakan belanja sayur yang lebih mudah!',
       style: TextStyle(
                    fontSize: 14,
                    color: Color.fromARGB(255, 98, 134, 100)
                  ),),

      SizedBox(height: 16),
      Text('Vegetables Order App',
       style: TextStyle(
                    fontSize: 14,
                    color: Color.fromARGB(255, 98, 134, 100),
                    fontWeight: FontWeight.bold,
                  ),),
      Text('Desain inspired by Alvian Teddy Cahya Putra',
       style: TextStyle(
                    fontSize: 14,
                    color: Color.fromARGB(255, 98, 134, 100)
                  ),),
       Text('Code by Sulistiani',
       style: TextStyle(
                    fontSize: 14,
                    color: Color.fromARGB(255, 98, 134, 100)
                  ),)

          ],
        ),
      ),
    );
  }

 
}