import 'package:flutter/material.dart';
import '../../../../common_widgets/refresh_indicator_model/threads_logo_indicator.dart';
import '../../../../constants/app_starter.dart';
import '../../objects/user.dart';
import '../comments_of_post_screen/build_post_include_all.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.user});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
  final User user;
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Image.asset(
          'assets/images/threads.png',
          width: 50,
          height: 50,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: ThreadsLogoIndicator(
          child: DecoratedBox(
            decoration: const BoxDecoration(
              color: Colors.black,
              boxShadow: [
                BoxShadow(
                  blurRadius: 2,
                  color: Colors.black12,
                  spreadRadius: 0.5,
                  offset: Offset(0.0, .0),
                )
              ],
            ),
            child: ListView.builder(
              itemCount: AppStarter.allThreads.length,
              itemBuilder: (context, index) {
                return BuildPostWithEverything2(
                  thread: AppStarter.allThreads[index],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
