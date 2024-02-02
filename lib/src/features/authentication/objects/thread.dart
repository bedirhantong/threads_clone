import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

import '../screens/comments_of_post_screen/build_post_include_all.dart';
import '../screens/comments_of_post_screen/comments_of_post_screen.dart';

class Thread {
  String whoPosted;
  String username;
  String? whatTextIsPosted;
  String? whatImageIsPosted;
  String whenPosted;
  double height;
  List<Widget>? commentsListWidget;
  String? id;
  int likeNum;

  // String token = "";

  Thread({
    required this.whoPosted,
    this.whatTextIsPosted,
    this.whatImageIsPosted,
    required this.whenPosted,
    required this.likeNum,
    this.commentsListWidget,
    required this.height,
    required this.username,
    this.id,
  });
}
