import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ITextTheme {
  static TextTheme lightTextTheme = TextTheme(
    headlineMedium: GoogleFonts.montserrat(
      color: Colors.black87,
    ),
  );
  static TextTheme darkTextTheme = TextTheme(
    headlineMedium: GoogleFonts.montserrat(
      color: Colors.white,
    ),
  );
}
