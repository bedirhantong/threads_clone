import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:threads_clone/src/constants/text_strings.dart';
import 'package:threads_clone/src/features/authentication/screens/login_screen/login_screen.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding:
              const EdgeInsets.symmetric(horizontal: 50.0, vertical: 120.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                otpTitle,
                style: TextStyle(fontSize: 80.0, fontWeight: FontWeight.bold),
              ),
              Text(
                otpSubTitle.toUpperCase(),
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const SizedBox(
                height: 60.0,
              ),
              Text(otpMessage,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge),
              const SizedBox(
                height: 60.0,
              ),
              OtpTextField(
                numberOfFields: 6,
                keyboardType: TextInputType.number,
                filled: true,
                fillColor: Colors.white.withOpacity(0.1),
                onSubmit: (code) {
                  print("OTP is => $code");
                },
              ),
              const SizedBox(
                height: 60.0,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    );
                  },
                  child: Text("Next".toUpperCase()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
