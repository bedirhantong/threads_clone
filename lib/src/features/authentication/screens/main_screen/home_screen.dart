import 'package:flutter/material.dart';
import 'package:threads_clone/src/features/authentication/screens/notifications_screen/notifications_screen.dart';

import '../post_screen/post_screen.dart';
import '../profile_screen/profile_screen.dart';
import '../search_screen/search_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          child: Text('Home Screen'),
        ),
      ),
    );
  }
}
