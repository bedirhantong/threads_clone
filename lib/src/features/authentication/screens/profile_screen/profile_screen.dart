import 'package:flutter/material.dart';

import '../main_screen/main_screen.dart';
import '../notifications_screen/notifications_screen.dart';
import '../post_screen/post_screen.dart';
import '../search_screen/search_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        body: Center(
          child: Text('Profile Screen'),
        ),
      ),
    );
  }
}
