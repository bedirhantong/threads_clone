import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../view_model/app_starter.dart';
import '../comments_of_post_screen/build_post_include_all.dart';

class ThreadsPosted extends ConsumerStatefulWidget {
  const ThreadsPosted({super.key});

  @override
  ConsumerState<ThreadsPosted> createState() => _ThreadsPostedState();
}

class _ThreadsPostedState extends ConsumerState<ThreadsPosted> {
  late AppStarter appStarter;

  @override
  Widget build(BuildContext context) {
    appStarter = ref.watch(userViewModelProvider);
    return appStarter.currentUser.threadsPosted.isNotEmpty
        ? ListView.builder(
            itemCount: appStarter.currentUser.threadsPosted.length,
            itemBuilder: (context, index) {
              return BuildPostWithEverything2(
                thread: appStarter.currentUser.threadsPosted[
                    appStarter.currentUser.threadsPosted.length - (index + 1)],
              );
            },
          )
        : const Center(
            child: Text(
              "No posted thread exist",
              style: TextStyle(color: Colors.white),
            ),
          );
  }
}
