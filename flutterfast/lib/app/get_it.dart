import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'get_it.config.dart';

const firebase = Environment('firebase');
const supabase = Environment('supabase');
const appwrite = Environment('appwrite');
const pocketbase = Environment('pocketbase');
const amplitude = Environment('amplitude');
const posthog = Environment('posthog');

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
Future<void> configureDependencies() async => await $initGetIt(
      getIt,
      environmentFilter: NoEnvOrContainsAny(
        {
          const String.fromEnvironment('PAAS', defaultValue: 'firebase'),
          //* Amplitude *//
          const String.fromEnvironment('analytics', defaultValue: 'amplitude'),
          //* Amplitude *//

          //* Posthog *//
          // const String.fromEnvironment('analytics', defaultValue: 'posthog'),
          //* Posthog *//
        },
      ),
    );
