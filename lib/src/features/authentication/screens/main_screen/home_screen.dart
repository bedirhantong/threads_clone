import 'package:flutter/material.dart';
import '../../../../common_widgets/refresh_indicator_model/threads_logo_indicator.dart';
import '../../view_model/app_starter.dart';
import '../comments_of_post_screen/build_post_include_all.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
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
            child: AppStarter.allThreads.isNotEmpty
                ? ListView.builder(
                    itemCount: AppStarter.allThreads.length,
                    itemBuilder: (context, index) {
                      return BuildPostWithEverything2(
                        thread: AppStarter.allThreads[
                            AppStarter.allThreads.length - (index + 1)],
                      );
                    },
                  )
                : const Center(
                    child: Text(
                      "No shared threads found",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
