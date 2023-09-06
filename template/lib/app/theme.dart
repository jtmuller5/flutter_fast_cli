import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

String? _fontFamily = GoogleFonts.quicksand().fontFamily;

ThemeData lightTheme = FlexThemeData.light(fontFamily: _fontFamily);

ThemeData darkTheme = FlexThemeData.dark(fontFamily: _fontFamily);
