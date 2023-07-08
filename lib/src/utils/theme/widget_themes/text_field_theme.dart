import 'package:flutter/material.dart';

import '../../../constants/colors.dart';

class TextFormFieldTheme {
  TextFormFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme =
      const InputDecorationTheme(
    border: OutlineInputBorder(),
    prefixIconColor: Colors.white,
    labelStyle: TextStyle(color: primaryColor),
    floatingLabelStyle: TextStyle(color: primaryColor),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(width: 2, color: primaryColor),
    ),
  );

  static InputDecorationTheme darkInputDecorationTheme =
      const InputDecorationTheme(
    border: OutlineInputBorder(),
    prefixIconColor: Colors.white,
    floatingLabelStyle: TextStyle(color: secondaryColor),
    labelStyle: TextStyle(color: secondaryColor),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(width: 2, color: secondaryColor),
    ),
  );
}
