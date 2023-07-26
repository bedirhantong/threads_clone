import 'package:flutter/material.dart';
import 'package:threads_clone/src/features/authentication/screens/main_screen/home_screen.dart';
import 'package:threads_clone/src/features/authentication/screens/notifications_screen/notifications_screen.dart';

import '../post_screen/post_screen.dart';
import '../profile_screen/profile_screen.dart';
import '../search_screen/search_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    SearchScreen(),
    PostScreen(),
    NotificationsScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        body: Container(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: buildBottomNavigationBar(),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: ImageIcon(AssetImage('assets/icons/home.png')),
          label: 'Home',
          backgroundColor: Colors.black,
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(AssetImage('assets/icons/search.png')),
          label: 'Search',
          backgroundColor: Colors.black,
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(AssetImage('assets/icons/post.png')),
          label: 'Post',
          backgroundColor: Colors.black,
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(AssetImage('assets/icons/like.png')),
          label: 'Notifications',
          backgroundColor: Colors.black,
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(AssetImage('assets/icons/profile.png')),
          label: 'Profile',
          backgroundColor: Colors.black,
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.amber[800],
      onTap: _onItemTapped,
    );
  }
}
