import 'package:flutter/material.dart';
import 'package:threads_clone/src/features/authentication/screens/main_screen/main_screen.dart';
import 'package:threads_clone/src/features/authentication/screens/post_screen/post_screen.dart';
import 'package:threads_clone/src/features/authentication/screens/profile_screen/profile_screen.dart';
import 'package:threads_clone/src/features/authentication/screens/search_screen/search_screen.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        body: Center(
          child: Text('Notifications Screen'),
        ),
      ),
    );
  }
}
