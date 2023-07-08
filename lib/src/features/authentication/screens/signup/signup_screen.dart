import 'package:flutter/material.dart';
import 'package:threads_clone/src/common_widgets/form/form_header_widget.dart';
import 'package:threads_clone/src/constants/image_strings.dart';
import 'package:threads_clone/src/constants/text_strings.dart';
import 'package:threads_clone/src/features/authentication/screens/main_screen/login_sceen.dart';
import 'package:threads_clone/src/features/authentication/screens/signup/widgets/signup_form_widget.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const FormHeaderWidget(
                    image: metaPng, subtitle: signupSubtitle),
                const SizedBox(
                  height: 5.0,
                ),
                const SignUpFormWidget(),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text("OR"),
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton.icon(
                          onPressed: () {},
                          icon: const Image(
                            image: AssetImage('assets/images/logo/google.png'),
                            width: 20.0,
                          ),
                          label: Text('Sign-Up with Google'),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()));
                        },
                        child: Text.rich(
                          TextSpan(
                            text: 'Already have an Account?',
                            style: Theme.of(context).textTheme.bodyMedium,
                            children: const [
                              TextSpan(
                                text: 'Login',
                                style: TextStyle(color: Colors.blue),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
