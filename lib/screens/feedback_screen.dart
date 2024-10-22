import 'package:flutter/material.dart';
import 'package:uts_2021110055/screens/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({super.key});

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Text(
          'Feedback',
            style: 
                  GoogleFonts.josefinSans(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
        ),
        centerTitle: true,
      ),
      body: Container(
        // color: const Color.fromARGB(255, 204, 204, 204), 
        padding: const EdgeInsets.all(16.0), 
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Teks "Write Your Feedback Here"
              Text(
                'Write Your Feedback Here',
                style: 
                  GoogleFonts.josefinSans(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 16), // Jarak antara teks dan TextFormField

              // Input feedback (multiline)
              TextFormField(
                keyboardType: TextInputType.multiline,
                minLines: 1,
                maxLines: 5, // Membatasi input maksimal 5 baris
                decoration: const InputDecoration(
                  labelText: 'Your Feedback',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20), // Jarak antara form dan tombol

              // Tombol "Submit"
              TextButton(
                onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                     SnackBar(
                      content: Text('Thank you for your feedback!',
                       style: 
                        GoogleFonts.josefinSans(
                            color: const Color.fromARGB(255, 255, 255, 255),
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                    ),
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  );
                },
                style: TextButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 132, 132, 132), // Warna tombol
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32.0,
                    vertical: 12.0,
                  ), // Padding untuk tombol
                ),
                child: const Text(
                  "Submit",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white, // Warna teks putih agar kontras
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}