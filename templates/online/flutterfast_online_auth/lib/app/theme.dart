import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutterfast_online_auth/features/shared/utils/navigation/no_transitions_builder.dart';
import 'package:google_fonts/google_fonts.dart';

String? _fontFamily = GoogleFonts.quicksand().fontFamily;
FlexScheme flexScheme = FlexScheme.flutterDash;

PageTransitionsTheme? pageTransitionsTheme = PageTransitionsTheme(
  builders: kIsWeb
      ? {
          // No animations for every OS if the app running on the web
          for (final platform in TargetPlatform.values) platform: const NoTransitionsBuilder(),
        }
      : {
          TargetPlatform.android: ZoomPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        },
);

// https://docs.flexcolorscheme.com/api_guide#flexsubthemesdata
FlexSubThemesData theme = FlexSubThemesData(
  appBarCenterTitle: false,
  tabBarIndicatorSize: TabBarIndicatorSize.label,
  inputDecoratorRadius: 8,
);

ThemeData lightTheme = FlexThemeData.light(
  fontFamily: _fontFamily,
  scheme: flexScheme,
  colorScheme: lightLogoColorScheme,
  subThemesData: theme,
  pageTransitionsTheme: pageTransitionsTheme,
);

ThemeData darkTheme = FlexThemeData.dark(
  fontFamily: _fontFamily,
  scheme: flexScheme,
  colorScheme: darkLogoColorScheme,
  subThemesData: theme,
  pageTransitionsTheme: pageTransitionsTheme,
);

ColorScheme? lightLogoColorScheme;
ColorScheme? darkLogoColorScheme;

extension FastColor on BuildContext {
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  Color get primary => colorScheme.primary;

  Color get secondary => colorScheme.secondary;

  Color get tertiary => colorScheme.tertiary;

  Color get primaryContainer => colorScheme.primaryContainer;

  Color get secondaryContainer => colorScheme.secondaryContainer;

  Color get tertiaryContainer => colorScheme.tertiaryContainer;

  Color get onPrimary => colorScheme.onPrimary;

  Color get onSecondary => colorScheme.onSecondary;

  Color get onTertiary => colorScheme.onTertiary;

  Color get background => colorScheme.background;

  Color get onBackground => colorScheme.onBackground;

  Color get surface => colorScheme.surface;

  Color get onSurface => colorScheme.onSurface;

  Color get surfaceTint => colorScheme.surfaceTint;

  Color get error => colorScheme.error;

  Color get onError => colorScheme.onError;

  Color get outline => colorScheme.outline;

  Color get inversePrimary => colorScheme.inversePrimary;

  Color get inverseSurface => colorScheme.inverseSurface;

  Color get onInverseSurface => colorScheme.onInverseSurface;
}
