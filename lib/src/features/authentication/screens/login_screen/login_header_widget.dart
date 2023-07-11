import 'package:flutter/material.dart';

class LoginHeaderWidget extends StatelessWidget {
  const LoginHeaderWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image(
          image: AssetImage(
            'assets/images/on_boarding_images/page1.png',
          ),
          height: size.height * 0.3,
        ),
        Text(
          'Welcome Back',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        Text(
          'Make it work, make it right, make it fast.',
          style: Theme.of(context).textTheme.labelMedium,
        ),
      ],
    );
  }
}
