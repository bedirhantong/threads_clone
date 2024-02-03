import 'package:flutter/material.dart';

abstract class BaseState<T extends StatefulWidget> extends State<T> {
  ThemeData get themeData => ThemeData(
        primaryColor: const Color(0xFF273C66),
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(color: Colors.white),
        ),
      );

  double dynamicHeight(double value) =>
      MediaQuery.sizeOf(context).height * value;
  double dynamicWidth(double value) => MediaQuery.sizeOf(context).width * value;
}
