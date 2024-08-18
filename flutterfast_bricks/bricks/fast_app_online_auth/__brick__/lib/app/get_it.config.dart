// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../features/ab_testing/services/fast_ab_test_service.dart' as _i623;
import '../features/ab_testing/services/firebase_ab_test_service.dart' as _i5;
import '../features/ab_testing/services/posthog_ab_test_service.dart' as _i573;
import '../features/analytics/services/amplitude_analytics_service.dart'
    as _i798;
import '../features/analytics/services/fast_analytics_service.dart' as _i697;
import '../features/analytics/services/firebase_analytics_service.dart'
    as _i1072;
import '../features/analytics/services/posthog_analytics_service.dart' as _i977;
import '../features/authentication/services/authentication_service/appwrite_authentication_service.dart'
    as _i337;
import '../features/authentication/services/authentication_service/fast_authentication_service.dart'
    as _i160;
import '../features/authentication/services/authentication_service/firebase_authentication_service.dart'
    as _i773;
import '../features/authentication/services/authentication_service/pocketbase_authentication_service.dart'
    as _i985;
import '../features/authentication/services/authentication_service/supabase_authentication_service.dart'
    as _i94;
import '../features/authentication/services/user_service/appwrite_user_service.dart'
    as _i588;
import '../features/authentication/services/user_service/fast_user_service.dart'
    as _i780;
import '../features/authentication/services/user_service/firebase_user_service.dart'
    as _i857;
import '../features/authentication/services/user_service/pocketbase_user_service.dart'
    as _i1;
import '../features/authentication/services/user_service/supabase_user_service.dart'
    as _i803;
import '../features/crash/services/crash_service.dart' as _i372;
import '../features/crash/services/fast_crash_service.dart' as _i869;
import '../features/feedback/services/appwrite_feedback_service.dart' as _i403;
import '../features/feedback/services/fast_feedback_service.dart' as _i921;
import '../features/feedback/services/firebase_feedback_service.dart' as _i565;
import '../features/feedback/services/pocketbase_feedback_service.dart'
    as _i145;
import '../features/feedback/services/supabase_feedback_service.dart' as _i891;
import '../features/settings/services/settings_service.dart' as _i542;
import '../features/shared/services/connector_service/appwrite_connector_service.dart'
    as _i947;
import '../features/shared/services/connector_service/fast_connector_service.dart'
    as _i802;
import '../features/shared/services/connector_service/firebase_connector_service.dart'
    as _i685;
import '../features/shared/services/connector_service/pocketbase_connector_service.dart'
    as _i90;
import '../features/shared/services/connector_service/supabase_connector_service.dart'
    as _i767;
import '../features/shared/services/dialog_service.dart' as _i242;
import '../features/shared/services/modules.dart' as _i176;
import '../features/shared/services/navigation_service.dart' as _i1032;
import '../features/subscriptions/services/subscription_service.dart' as _i506;
import '../modules/chat/services/appwrite_chat_service.dart' as _i765;
import '../modules/chat/services/fast_chat_service.dart' as _i75;
import '../modules/chat/services/firebase_chat_service.dart' as _i387;
import '../modules/chat/services/pocketbase_chat_service.dart' as _i1006;
import '../modules/chat/services/supabase_chat_service.dart' as _i445;

const String _supabase = 'supabase';
const String _firebase = 'firebase';
const String _appwrite = 'appwrite';
const String _pocketbase = 'pocketbase';
const String _posthog = 'posthog';
const String _fanalytics = 'fanalytics';
const String _amplitude = 'amplitude';

// initializes the registration of main-scope dependencies inside of GetIt
Future<_i174.GetIt> $initGetIt(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i526.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final registerModule = _$RegisterModule();
  gh.factory<_i1032.NavigationService>(() => _i1032.NavigationService());
  await gh.factoryAsync<_i460.SharedPreferences>(
    () => registerModule.sharedPrefs,
    preResolve: true,
  );
  gh.factory<_i242.DialogService>(() => _i242.DialogService());
  gh.singleton<_i506.SubscriptionService>(() => _i506.SubscriptionService());
  gh.lazySingleton<_i780.FastUserService>(
    () => _i803.SupabaseUserService(),
    registerFor: {_supabase},
  );
  gh.lazySingleton<_i623.FastAbTestService>(
    () => _i5.FirebaseAbTestService(),
    registerFor: {_firebase},
  );
  gh.lazySingleton<_i921.FastFeedbackService>(
    () => _i403.AppwriteFeedbackService(),
    registerFor: {_appwrite},
  );
  gh.lazySingleton<_i921.FastFeedbackService>(
    () => _i891.SupabaseFeedbackService(),
    registerFor: {_supabase},
  );
  gh.singleton<_i780.FastUserService>(
    () => _i1.PocketBaseUserService(),
    registerFor: {_pocketbase},
  );
  gh.factory<_i802.FastConnectorService>(
    () => _i685.FirebaseConnectorService(),
    registerFor: {_firebase},
  );
  gh.singleton<_i160.FastAuthenticationService>(
    () => _i985.PocketBaseAuthenticationService(),
    registerFor: {_pocketbase},
  );
  gh.lazySingleton<_i75.FastChatService>(
    () => _i765.AppwriteChatService(),
    registerFor: {_appwrite},
  );
  gh.singleton<_i160.FastAuthenticationService>(
    () => _i94.SupabaseAuthenticationService(),
    registerFor: {_supabase},
  );
  gh.lazySingleton<_i780.FastUserService>(
    () => _i857.FirebaseUserService(),
    registerFor: {_firebase},
  );
  gh.factory<_i802.FastConnectorService>(
    () => _i767.SupabaseConnectorService(),
    registerFor: {_supabase},
  );
  gh.lazySingleton<_i75.FastChatService>(
    () => _i387.FirebaseChatService(),
    registerFor: {_firebase},
  );
  gh.singleton<_i160.FastAuthenticationService>(
    () => _i773.FirebaseAuthenticationService(),
    registerFor: {_firebase},
  );
  gh.lazySingleton<_i75.FastChatService>(
    () => _i1006.PocketbaseChatService(),
    registerFor: {_pocketbase},
  );
  gh.singleton<_i160.FastAuthenticationService>(
    () => _i337.AppwriteAuthenticationService(),
    registerFor: {_appwrite},
  );
  gh.factory<_i802.FastConnectorService>(
    () => _i90.PocketBaseConnectorService(),
    registerFor: {_pocketbase},
  );
  gh.singleton<_i623.FastAbTestService>(
    () => _i573.PosthogAbTestService(),
    registerFor: {_posthog},
  );
  gh.lazySingleton<_i780.FastUserService>(
    () => _i588.AppwriteUserservice(),
    registerFor: {_appwrite},
  );
  gh.singleton<_i697.FastAnalyticsService>(
    () => _i977.PosthogAnalyticsService(),
    registerFor: {_posthog},
  );
  gh.lazySingleton<_i75.FastChatService>(
    () => _i445.SupabaseChatService(),
    registerFor: {_supabase},
  );
  gh.singleton<_i869.FastCrashService>(() => _i372.CrashService());
  gh.lazySingleton<_i921.FastFeedbackService>(
    () => _i565.FirebaseFeedbackService(),
    registerFor: {_firebase},
  );
  gh.factory<_i802.FastConnectorService>(
    () => _i947.AppwriteConnectorService(),
    registerFor: {_appwrite},
  );
  gh.lazySingleton<_i921.FastFeedbackService>(
    () => _i145.PocketBaseFeedbackService(),
    registerFor: {_pocketbase},
  );
  gh.singleton<_i697.FastAnalyticsService>(
    () => _i1072.FirebaseAnalyticsService(),
    registerFor: {_fanalytics},
  );
  gh.singleton<_i697.FastAnalyticsService>(
    () => _i798.AmplitudeAnalyticsService(),
    registerFor: {_amplitude},
  );
  gh.singleton<_i542.SettingsService>(() => _i542.SettingsService());
  return getIt;
}

class _$RegisterModule extends _i176.RegisterModule {}
