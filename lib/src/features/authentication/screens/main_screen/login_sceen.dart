import 'package:flutter/material.dart';

import 'login_form_widget.dart';
import 'login_header_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        // childini scrollable yapıyor
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 50.0),
          // padding: EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              LoginHeaderWidget(size: size),
              const LoginForm(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('OR'),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      onPressed: () {},
                      icon: const Image(
                        image: AssetImage('assets/images/logo/google.png'),
                        width: 20.0,
                      ),
                      label: Text('Sign-In with Google'),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text.rich(
                      TextSpan(),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
