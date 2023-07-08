import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Image.asset(
          'assets/images/threads.png',
          width: 50,
          height: 50,
        ),
        centerTitle: true,
        // backgroundColor: Colors.black,
      ),
      body: Container(),
    );
  }
}
