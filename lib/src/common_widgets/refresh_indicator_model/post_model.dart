import 'package:flutter/material.dart';

class PostModel {
  // final String id;
  final String title;
  final String image;

  PostModel({
    // required this.id,
    required this.title,
    required this.image,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      // id: json['id'],
      title: json['title'],
      image: json['image'],
    );
  }
}
