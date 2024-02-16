import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
//* Posthog *//
import 'package:posthog_flutter/posthog_flutter.dart';
//* Posthog *//
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:flutterfast/app/get_it.dart';
import 'package:flutterfast/app/router.dart';
import 'package:flutterfast/app/services.dart';
import 'package:flutterfast/app/theme.dart';
import 'package:flutterfast/features/shared/utils/navigation/basic_observer.dart';
import 'package:universal_html/html.dart' as html;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  await authenticationService.initialize();
  await analyticsService.initialize();
  GetIt.instance.registerSingleton(AppRouter());

  //* LogoColorScheme *//
  lightLogoColorScheme = await ColorScheme.fromImageProvider(
    provider: const AssetImage('assets/images/logo.png'),
    brightness: Brightness.light,
  );
  darkLogoColorScheme = await ColorScheme.fromImageProvider(
    provider: const AssetImage('assets/images/logo.png'),
    brightness: Brightness.dark,
  );
  //* LogoColorScheme *//

  //* Subscriptions *//
  await subscriptionService.initialize();
  //* Subscriptions *//

  html.document.dispatchEvent(html.CustomEvent("dart_loaded"));
  await SentryFlutter.init(
    (options) {
      options.dsn = const String.fromEnvironment('SENTRY_DSN');
    },
    appRunner: () => runApp(const MainApp()),
  );

  // runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: settingsService.themeMode,
        builder: (context, mode, child) {
          return MaterialApp.router(
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: mode,
            routerConfig: router.config(
              navigatorObservers: () => [
                SentryNavigatorObserver(),
                BasicObserver(),

                //* Posthog *//
                PosthogObserver(),
                //* Posthog *//
              ],
              deepLinkBuilder: (deepLink) {
                debugPrint('deeplink: ${deepLink.path}');

                return deepLink;
              },
            ),
          );
        });
  }
}
