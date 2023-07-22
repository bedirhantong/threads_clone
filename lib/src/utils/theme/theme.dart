import 'package:flutter/material.dart';
import 'package:threads_clone/src/utils/theme/widget_themes/text_field_theme.dart';
import 'package:threads_clone/src/utils/theme/widget_themes/text_theme.dart';

class ThreadsAppTheme {
  /*
  Classın nesnesini oluşturup kullanılmamasını sağlamak için constructoru private yapacağız
  */
  ThreadsAppTheme._();

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    textTheme: ITextTheme.lightTextTheme,
    appBarTheme: const AppBarTheme(
      color: Colors.white,
    ),
    elevatedButtonTheme: const ElevatedButtonThemeData(),
    inputDecorationTheme: TextFormFieldTheme.lightInputDecorationTheme,
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    textTheme: ITextTheme.darkTextTheme,
    appBarTheme: const AppBarTheme(
      color: Colors.black,
    ),
    inputDecorationTheme: TextFormFieldTheme.darkInputDecorationTheme,
    elevatedButtonTheme: const ElevatedButtonThemeData(),
  );
}
