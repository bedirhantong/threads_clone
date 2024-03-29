import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:threads_clone/src/features/authentication/screens/on_boarding/page2.dart';

class OnboardingFirst extends StatefulWidget {
  const OnboardingFirst({super.key});

  @override
  State<OnboardingFirst> createState() => _OnboardingFirstState();
}

class _OnboardingFirstState extends State<OnboardingFirst> {
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
              'assets/images/on_boarding_images/page1.png',
              // 'assets/images/socialmedia.gif',
              cacheWidth: 300,
              cacheHeight: 300,
            ),
            Center(
              child: Text(
                'Welcome, Threads application developed by Meta company will bring you closer to your friends on Instagram.',
                style: GoogleFonts.robotoMono(),
              ),
            ),
            OutlinedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Page2(),
                  ),
                );
              },
              child: Text(
                'Let\'s get started',
                style: GoogleFonts.robotoMono(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
