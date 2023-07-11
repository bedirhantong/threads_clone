import 'package:flutter/material.dart';

import '../main_screen/main_screen.dart';
import '../notifications_screen/notifications_screen.dart';
import '../post_screen/post_screen.dart';
import '../profile_screen/profile_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        body: Center(
          child: Text('Search Screen'),
        ),
      ),
    );
  }
}
