import 'package:flutter/material.dart';
import 'package:threads_clone/src/features/authentication/objects/user.dart';

class Thread {
  User whoPosted;
  String? whatTextIsPosted;
  String? whatImageIsPosted;
  String whenPosted;
  List<Widget>? commentsListWidget = [];
  String? id;
  int likeNum;

  Thread({
    required this.whoPosted,
    this.whatTextIsPosted,
    this.whatImageIsPosted,
    required this.whenPosted,
    required this.likeNum,
    this.commentsListWidget,
    this.id,
  });
}
