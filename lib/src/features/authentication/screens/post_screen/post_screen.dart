import 'package:flutter/material.dart';

import '../main_screen/main_screen.dart';
import '../notifications_screen/notifications_screen.dart';
import '../profile_screen/profile_screen.dart';
import '../search_screen/search_screen.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Text('Post Screen'),
        ),
      ),
    );
  }
}
