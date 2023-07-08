import 'package:flutter/material.dart';

import '../main_screen/first_screen.dart';

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
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Text(
              "There is just 1 option to login that is Instagram!",
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 30,
            ),
            OutlinedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FirstScreen(),
                  ),
                );
              },
              style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0))),
              child: Text(
                'Login with Instagram',
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
