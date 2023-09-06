String getTextThemeText(String appName) {

  appName = appName.toLowerCase();

  return '''
import 'package:flutter/material.dart';
import 'package:$appName/app/services.dart';

extension FastTextStyle on BuildContext {
  TextStyle get bodySmall => Theme.of(this).textTheme.bodySmall!;

  TextStyle get bodyMedium => Theme.of(this).textTheme.bodyMedium!;

  TextStyle get bodyLarge => Theme.of(this).textTheme.bodyLarge!;

  TextStyle get labelSmall => Theme.of(this).textTheme.labelSmall!;

  TextStyle get labelMedium => Theme.of(this).textTheme.labelMedium!;

  TextStyle get labelLarge => Theme.of(this).textTheme.labelLarge!;

  TextStyle get titleSmall => Theme.of(this).textTheme.titleSmall!;

  TextStyle get titleMedium => Theme.of(this).textTheme.titleMedium!;

  TextStyle get titleLarge => Theme.of(this).textTheme.titleLarge!;

  TextStyle get headlineSmall => Theme.of(this).textTheme.headlineSmall!;

  TextStyle get headlineMedium => Theme.of(this).textTheme.headlineMedium!;

  TextStyle get headlineLarge => Theme.of(this).textTheme.headlineLarge!;

  TextStyle get displaySmall => Theme.of(this).textTheme.displaySmall!;

  TextStyle get displayMedium => Theme.of(this).textTheme.displayMedium!;

  TextStyle get displayLarge => Theme.of(this).textTheme.displayLarge!;
}

extension FastTextColor on TextStyle {

  BuildContext get context => router.navigatorKey.currentContext!;

  TextStyle get primary => copyWith(color: Theme.of(context).colorScheme.primary);

  TextStyle get secondary => copyWith(color: Theme.of(context).colorScheme.secondary);

  TextStyle get tertiary => copyWith(color: Theme.of(context).colorScheme.tertiary);

  TextStyle get onPrimary => copyWith(color: Theme.of(context).colorScheme.onPrimary);

  TextStyle get onSecondary => copyWith(color: Theme.of(context).colorScheme.onSecondary);

  TextStyle get onTertiary => copyWith(color: Theme.of(context).colorScheme.onTertiary);

  TextStyle get background => copyWith(color: Theme.of(context).colorScheme.background);

  TextStyle get onBackground => copyWith(color: Theme.of(context).colorScheme.onBackground);

  TextStyle get surface => copyWith(color: Theme.of(context).colorScheme.surface);

  TextStyle get onSurface => copyWith(color: Theme.of(context).colorScheme.onSurface);

  TextStyle get surfaceTint => copyWith(color: Theme.of(context).colorScheme.surfaceTint);

  TextStyle get error => copyWith(color: Theme.of(context).colorScheme.error);

  TextStyle get onError => copyWith(color: Theme.of(context).colorScheme.onError);

  TextStyle get outline => copyWith(color: Theme.of(context).colorScheme.outline);

  TextStyle get inversePrimary => copyWith(color: Theme.of(context).colorScheme.inversePrimary);

  TextStyle get inverseSurface => copyWith(color: Theme.of(context).colorScheme.inverseSurface);

  TextStyle get onInverseSurface => copyWith(color: Theme.of(context).colorScheme.onInverseSurface);
}
''';
}
