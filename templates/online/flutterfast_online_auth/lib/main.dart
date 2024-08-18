import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:posthog_flutter/posthog_flutter.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:flutterfast_online_auth/app/get_it.dart';
import 'package:flutterfast_online_auth/app/router.dart';
import 'package:flutterfast_online_auth/app/services.dart';
import 'package:flutterfast_online_auth/app/theme.dart';
import 'package:flutterfast_online_auth/features/shared/utils/navigation/basic_observer.dart';
import 'package:universal_html/html.dart' as html;
import 'package:flutter_web_plugins/url_strategy.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  usePathUrlStrategy();
  await configureDependencies();
  await authenticationService.initialize();
  await analyticsService.initialize();
  GetIt.instance.registerSingleton(AppRouter());

  lightLogoColorScheme = await ColorScheme.fromImageProvider(
    provider: const AssetImage('assets/logo.png'),
    brightness: Brightness.light,
  );
  darkLogoColorScheme = await ColorScheme.fromImageProvider(
    provider: const AssetImage('assets/logo.png'),
    brightness: Brightness.dark,
  );

  await subscriptionService.initialize();

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
          debugShowCheckedModeBanner: false,
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: mode,
          routerConfig: router.config(
            navigatorObservers: () => [
              SentryNavigatorObserver(),
              BasicObserver(),
              PosthogObserver(),
            ],
            deepLinkBuilder: (deepLink) {
              debugPrint('deeplink: ${deepLink.path}');

              return deepLink;
            },
          ),
        );
      },
    );
  }
}
