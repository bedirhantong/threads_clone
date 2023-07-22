import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.lock),
          backgroundColor: Colors.black,
          title: const Align(
            alignment: Alignment.centerRight,
            child: Icon(Icons.settings_outlined),
          ),
          centerTitle: true,
        ),
        body: Container(
          padding: const EdgeInsets.all(10.0),
          color: Colors.black,
          child: Column(
            children: [
              Container(),
            ],
          ),
        ),
      ),
    );
  }
}
