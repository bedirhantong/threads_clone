import 'package:flutter/material.dart';

class AllNotificationsScreen extends StatefulWidget {
  const AllNotificationsScreen({super.key, required this.outlinedButton});
  final OutlinedButton outlinedButton;
  @override
  State<AllNotificationsScreen> createState() => _AllNotificationsScreenState();
}

class _AllNotificationsScreenState extends State<AllNotificationsScreen> {
  static Color buttonBackgroundColor = Colors.black87;
  static Color buttonTextColor = Colors.white;
  static Color buttonBorderColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        fixedSize: const Size(120.0, 0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        side: BorderSide(color: buttonBorderColor),
        backgroundColor: buttonBackgroundColor,
      ),
      onPressed: () {
        setState(() {
          changeButtonColor();
        });
      },
      child: Text(
        "All",
        style: TextStyle(color: buttonTextColor),
      ),
    );
  }

  static void changeButtonColor() {
    if (buttonBackgroundColor == Colors.black) {
      buttonBackgroundColor = Colors.white;
    } else {
      buttonBackgroundColor = Colors.black;
    }

    if (buttonTextColor == Colors.white) {
      buttonTextColor = Colors.black;
    } else {
      buttonTextColor = Colors.white;
    }

    if (buttonBorderColor == Colors.grey) {
      buttonBorderColor = Colors.white;
    } else {
      buttonBorderColor = Colors.grey;
    }
  }
}
