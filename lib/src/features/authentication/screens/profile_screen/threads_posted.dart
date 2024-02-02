import 'package:flutter/material.dart';

import '../../../../constants/app_starter.dart';
import '../comments_of_post_screen/build_post_include_all.dart';

class ThreadsPosted extends StatefulWidget {
  const ThreadsPosted({super.key});

  @override
  State<ThreadsPosted> createState() => _ThreadsPostedState();
}

class _ThreadsPostedState extends State<ThreadsPosted> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: AppStarter.allThreads.length,
      itemBuilder: (context, index) {
        return BuildPostWithEverything2(
          thread: AppStarter.allThreads[index],
        );
      },
    );
  }
}
