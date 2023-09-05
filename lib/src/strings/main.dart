String getMainText() {
  return '''
import 'package:amplitude_flutter/amplitude.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:template/app/get_it.dart';
import 'package:template/app/router.dart';
import 'package:template/app/services.dart';
import 'package:template/features/shared/utils/navigation/basic_observer.dart';

final Amplitude amplitude = Amplitude.getInstance();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await amplitude.init(const String.fromEnvironment('AMPLITUDE_API_KEY'));
  await configureDependencies();
  GetIt.instance.registerSingleton(AppRouter());
  await subscriptionService.initPlatformState();

  await SentryFlutter.init(
    (options) {
      options.dsn = const String.fromEnvironment('SENTRY_DSN');
    },
    appRunner: () => runApp(const MainApp()),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: FlexThemeData.light(fontFamily: GoogleFonts.abhayaLibre().fontFamily),
      darkTheme: FlexThemeData.dark(fontFamily: GoogleFonts.abhayaLibre().fontFamily),
      themeMode: ThemeMode.system,
      routerConfig: router.config(
        navigatorObservers: () => [
          SentryNavigatorObserver(),
          BasicObserver(),
        ],
      ),
    );
  }
}
  ''';
}