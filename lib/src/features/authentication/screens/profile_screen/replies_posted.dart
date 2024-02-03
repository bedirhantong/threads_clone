import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../view_model/app_starter.dart';
import '../comments_of_post_screen/build_post_include_all.dart';

class RepliesPosted extends ConsumerStatefulWidget {
  const RepliesPosted({super.key});

  @override
  ConsumerState<RepliesPosted> createState() => _RepliesPostedState();
}

class _RepliesPostedState extends ConsumerState<RepliesPosted> {
  late AppStarter appStarter;

  @override
  Widget build(BuildContext context) {
    appStarter = ref.watch(userViewModelProvider);
    return appStarter.currentUser.threadsLiked.isNotEmpty
        ? ListView.builder(
            itemCount: appStarter.currentUser.threadsLiked.length,
            itemBuilder: (context, index) {
              return BuildPostWithEverything2(
                thread: appStarter.currentUser.threadsLiked[
                    appStarter.currentUser.threadsLiked.length - (index + 1)],
              );
            },
          )
        : const Center(
            child: Text(
              "No replied or liked thread exist",
              style: TextStyle(color: Colors.white),
            ),
          );
  }
}
