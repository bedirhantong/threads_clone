import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:threads_clone/src/features/authentication/screens/main_screen/signup_screen.dart';

import '../main_screen/login_sceen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
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
            Text(
              "There is just 1 option to login that is Instagram!",
              textAlign: TextAlign.center,
              style: GoogleFonts.robotoMono(),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ),
                    );
                  },
                  style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2.0))),
                  child: Text(
                    'Login',
                    style: GoogleFonts.robotoMono(),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Signup(),
                      ),
                    );
                  },
                  style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2.0))),
                  child: Text(
                    'Signup',
                    style: GoogleFonts.robotoMono(),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
