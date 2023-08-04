import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:threads_clone/src/features/authentication/screens/login_screen/official/official_login.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Image(
            image: AssetImage("assets/images/threads.png"),
            height: 100,
            width: 100,
          ),
          const Image(
            image: AssetImage("assets/images/welcome_images/welcome.png"),
          ),
          Text(
            'Let\'s get started',
            textAlign: TextAlign.center,
            style: GoogleFonts.robotoMono(fontSize: 22.0),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            "There is just 1 option to login that is Instagram!",
            textAlign: TextAlign.center,
            style: GoogleFonts.robotoMono(),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 48.0),
            child: SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const OfficialLoginPage(),
                    ),
                  );
                },
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2.0),
                  ),
                ),
                child: Text(
                  'Login',
                  style: GoogleFonts.robotoMono(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
