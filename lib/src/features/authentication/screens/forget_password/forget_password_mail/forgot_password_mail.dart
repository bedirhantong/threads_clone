import 'package:flutter/material.dart';
import 'package:threads_clone/src/constants/sizes.dart';
import 'package:threads_clone/src/features/authentication/screens/forget_password/forget_password_otp/otp_screen.dart';

import '../../../../../common_widgets/form/form_header_widget.dart';
import '../../../../../constants/image_strings.dart';
import '../../../../../constants/text_strings.dart';

class ForgotPasswordMailScreen extends StatelessWidget {
  const ForgotPasswordMailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(defaultSize),
            child: Column(
              children: [
                const FormHeaderWidget(
                  image: otpEmailPng,
                  subtitle: forgotMailSubTitle,
                  imageHeight: 0.5,
                ),
                const SizedBox(
                  height: 50.0,
                ),
                Form(
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          label: Text("Email"),
                          hintText: 'Email',
                          prefixIcon: Icon(Icons.email_outlined),
                        ),
                      ),
                      const SizedBox(
                        height: 50.0,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            // Navigator.pop(context);
                            // Navigator.pop(context);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const OTPScreen()));
                          },
                          child: const Text('Next'),
                        ),
                      ),
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
