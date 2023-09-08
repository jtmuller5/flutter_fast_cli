import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutterfast/app/services.dart';
import 'package:google_fonts/google_fonts.dart';

String? _fontFamily = GoogleFonts.quicksand().fontFamily;

ThemeData lightTheme = FlexThemeData.light(fontFamily: _fontFamily);

ThemeData darkTheme = FlexThemeData.dark(fontFamily: _fontFamily);

extension FastColor on BuildContext {
  BuildContext get context => router.navigatorKey.currentContext!;

  Color get primary => Theme.of(context).colorScheme.primary;

  Color get secondary => Theme.of(context).colorScheme.secondary;

  Color get tertiary => Theme.of(context).colorScheme.tertiary;

  Color get primaryContainer => Theme.of(context).colorScheme.primaryContainer;

  Color get secondaryContainer => Theme.of(context).colorScheme.secondaryContainer;

  Color get tertiaryContainer => Theme.of(context).colorScheme.tertiaryContainer;

  Color get onPrimary => Theme.of(context).colorScheme.onPrimary;

  Color get onSecondary => Theme.of(context).colorScheme.onSecondary;

  Color get onTertiary => Theme.of(context).colorScheme.onTertiary;

  Color get background => Theme.of(context).colorScheme.background;

  Color get onBackground => Theme.of(context).colorScheme.onBackground;

  Color get surface => Theme.of(context).colorScheme.surface;

  Color get onSurface => Theme.of(context).colorScheme.onSurface;

  Color get surfaceTint => Theme.of(context).colorScheme.surfaceTint;

  Color get error => Theme.of(context).colorScheme.error;

  Color get onError => Theme.of(context).colorScheme.onError;

  Color get outline => Theme.of(context).colorScheme.outline;

  Color get inversePrimary => Theme.of(context).colorScheme.inversePrimary;

  Color get inverseSurface => Theme.of(context).colorScheme.inverseSurface;

  Color get onInverseSurface => Theme.of(context).colorScheme.onInverseSurface;
}