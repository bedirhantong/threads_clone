import 'package:flutter/material.dart';

class CommentOfPostScreen extends StatefulWidget {
  const CommentOfPostScreen({
    super.key,
    required this.myWidget,
  });
  final Widget myWidget;

  @override
  State<CommentOfPostScreen> createState() => _CommentOfPostScreenState();
}

class _CommentOfPostScreenState extends State<CommentOfPostScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Thread',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            widget.myWidget,
            Divider(color: Colors.grey, thickness: 1),
            widget.myWidget,
            Divider(color: Colors.grey, thickness: 1),
            widget.myWidget,
            Divider(color: Colors.grey, thickness: 1),
            widget.myWidget,
          ],
        ),
      ),
    );
  }
}
