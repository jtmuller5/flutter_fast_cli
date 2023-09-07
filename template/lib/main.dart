import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:template/app/get_it.dart';
import 'package:template/app/router.dart';
import 'package:template/app/services.dart';
import 'package:template/app/theme.dart';
import 'package:template/features/shared/utils/navigation/basic_observer.dart';
import 'package:template/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await configureDependencies();
  await authenticationService.initialize();
  await analyticsService.initialize();
  GetIt.instance.registerSingleton(AppRouter());
  await subscriptionService.initialize();

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
            ],
          ),
        );
      }
    );
  }
}
