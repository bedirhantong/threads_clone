import 'package:flutter/material.dart';

import '../../../../constants/app_starter.dart';
import '../comments_of_post_screen/build_post_include_all.dart';

class RepliesPosted extends StatefulWidget {
  const RepliesPosted({super.key});

  @override
  State<RepliesPosted> createState() => _RepliesPostedState();
}

class _RepliesPostedState extends State<RepliesPosted> {
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
