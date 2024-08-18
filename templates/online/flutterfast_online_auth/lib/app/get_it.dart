import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'get_it.config.dart';

const firebase = Environment('firebase');
const supabase = Environment('supabase');
const appwrite = Environment('appwrite');
const pocketbase = Environment('pocketbase');
const amplitude = Environment('amplitude');
const posthog = Environment('posthog');
const fanalytics = Environment('fanalytics');

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
          // firebase, supabase, pocketbase, appwrite
          const String.fromEnvironment('PAAS', defaultValue: 'firebase'),
          // amplitude, posthog, fanalytics
          const String.fromEnvironment('analytics', defaultValue: 'amplitude'),
        },
      ),
    );
