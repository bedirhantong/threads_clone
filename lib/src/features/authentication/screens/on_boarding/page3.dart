import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../welcome/welcome_screen.dart';

class Page3 extends StatefulWidget {
  const Page3({super.key});

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/images/threads.png',
          width: 50,
          height: 50,
        ),
        centerTitle: true,
        // backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              'assets/images/on_boarding_images/page3.png',
              cacheWidth: 300,
              cacheHeight: 300,
            ),
            Center(
              child: Text(
                'If you are ready, let\'s start the Threads adventure by logging in using Instagram.',
                style: GoogleFonts.robotoMono(),
              ),
            ),
            OutlinedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const WelcomeScreen(),
                  ),
                );
              },
              child: Text(
                'Start',
                style: GoogleFonts.robotoMono(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
