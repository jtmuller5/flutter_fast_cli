// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i4;

import '../features/ab_testing/services/fast_ab_test_service.dart' as _i18;
import '../features/ab_testing/services/firebase_ab_test_service.dart' as _i27;
import '../features/ab_testing/services/posthog_ab_test_service.dart' as _i19;
import '../features/analytics/services/amplitude_analytics_service.dart'
    as _i39;
import '../features/analytics/services/fast_analytics_service.dart' as _i32;
import '../features/analytics/services/posthog_analytics_service.dart' as _i33;
import '../features/authentication/services/authentication_service/appwrite_authentication_service.dart'
    as _i23;
import '../features/authentication/services/authentication_service/fast_authentication_service.dart'
    as _i22;
import '../features/authentication/services/authentication_service/firebase_authentication_service.dart'
    as _i29;
import '../features/authentication/services/authentication_service/pocketbase_authentication_service.dart'
    as _i24;
import '../features/authentication/services/authentication_service/supabase_authentication_service.dart'
    as _i26;
import '../features/authentication/services/user_service/appwrite_user_service.dart'
    as _i8;
import '../features/authentication/services/user_service/fast_user_service.dart'
    as _i7;
import '../features/authentication/services/user_service/firebase_user_service.dart'
    as _i25;
import '../features/authentication/services/user_service/pocketbase_user_service.dart'
    as _i21;
import '../features/authentication/services/user_service/supabase_user_service.dart'
    as _i36;
import '../features/crash/services/crash_service.dart' as _i10;
import '../features/crash/services/fast_crash_service.dart' as _i9;
import '../features/feedback/services/appwrite_feedback_service.dart' as _i13;
import '../features/feedback/services/fast_feedback_service.dart' as _i11;
import '../features/feedback/services/firebase_feedback_service.dart' as _i35;
import '../features/feedback/services/pocketbase_feedback_service.dart' as _i28;
import '../features/feedback/services/supabase_feedback_service.dart' as _i12;
import '../features/settings/services/settings_service.dart' as _i40;
import '../features/shared/services/connector_service/appwrite_connector_service.dart'
    as _i15;
import '../features/shared/services/connector_service/fast_connector_service.dart'
    as _i14;
import '../features/shared/services/connector_service/firebase_connector_service.dart'
    as _i38;
import '../features/shared/services/connector_service/pocketbase_connector_service.dart'
    as _i34;
import '../features/shared/services/connector_service/supabase_connector_service.dart'
    as _i31;
import '../features/shared/services/dialog_service.dart' as _i5;
import '../features/shared/services/modules.dart' as _i41;
import '../features/shared/services/navigation_service.dart' as _i3;
import '../features/subscriptions/services/subscription_service.dart' as _i6;
import '../modules/chat/services/appwrite_chat_service.dart' as _i20;
import '../modules/chat/services/fast_chat_service.dart' as _i16;
import '../modules/chat/services/firebase_chat_service.dart' as _i17;
import '../modules/chat/services/pocketbase_chat_service.dart' as _i37;
import '../modules/chat/services/supabase_chat_service.dart' as _i30;

const String _appwrite = 'appwrite';
const String _supabase = 'supabase';
const String _firebase = 'firebase';
const String _posthog = 'posthog';
const String _pocketbase = 'pocketbase';
const String _amplitude = 'amplitude';

// initializes the registration of main-scope dependencies inside of GetIt
Future<_i1.GetIt> $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final registerModule = _$RegisterModule();
  gh.factory<_i3.NavigationService>(() => _i3.NavigationService());
  await gh.factoryAsync<_i4.SharedPreferences>(
    () => registerModule.sharedPrefs,
    preResolve: true,
  );
  gh.factory<_i5.DialogService>(() => _i5.DialogService());
  gh.singleton<_i6.SubscriptionService>(() => _i6.SubscriptionService());
  gh.lazySingleton<_i7.FastUserService>(
    () => _i8.AppwriteUserservice(),
    registerFor: {_appwrite},
  );
  gh.singleton<_i9.FastCrashService>(() => _i10.CrashService());
  gh.lazySingleton<_i11.FastFeedbackService>(
    () => _i12.SupabaseFeedbackService(),
    registerFor: {_supabase},
  );
  gh.lazySingleton<_i11.FastFeedbackService>(
    () => _i13.AppwriteFeedbackService(),
    registerFor: {_appwrite},
  );
  gh.factory<_i14.FastConnectorService>(
    () => _i15.AppwriteConnectorService(),
    registerFor: {_appwrite},
  );
  gh.lazySingleton<_i16.FastChatService>(
    () => _i17.FirebaseChatService(),
    registerFor: {_firebase},
  );
  gh.singleton<_i18.FastAbTestService>(
    () => _i19.PosthogAbTestService(),
    registerFor: {_posthog},
  );
  gh.lazySingleton<_i16.FastChatService>(
    () => _i20.AppwriteChatService(),
    registerFor: {_appwrite},
  );
  gh.singleton<_i7.FastUserService>(
    () => _i21.PocketBaseUserService(),
    registerFor: {_pocketbase},
  );
  gh.singleton<_i22.FastAuthenticationService>(
    () => _i23.AppwriteAuthenticationService(),
    registerFor: {_appwrite},
  );
  gh.singleton<_i22.FastAuthenticationService>(
    () => _i24.PocketBaseAuthenticationService(),
    registerFor: {_pocketbase},
  );
  gh.lazySingleton<_i7.FastUserService>(
    () => _i25.FirebaseUserService(),
    registerFor: {_firebase},
  );
  gh.singleton<_i22.FastAuthenticationService>(
    () => _i26.SupabaseAuthenticationService(),
    registerFor: {_supabase},
  );
  gh.singleton<_i18.FastAbTestService>(
    () => _i27.FirebaseAbTestService(),
    registerFor: {_firebase},
  );
  gh.lazySingleton<_i11.FastFeedbackService>(
    () => _i28.PocketBaseFeedbackService(),
    registerFor: {_pocketbase},
  );
  gh.singleton<_i22.FastAuthenticationService>(
    () => _i29.FirebaseAuthenticationService(),
    registerFor: {_firebase},
  );
  gh.lazySingleton<_i16.FastChatService>(
    () => _i30.SupabaseChatService(),
    registerFor: {_supabase},
  );
  gh.factory<_i14.FastConnectorService>(
    () => _i31.SupabaseConnectorService(),
    registerFor: {_supabase},
  );
  gh.singleton<_i32.FastAnalyticsService>(
    () => _i33.PosthogAnalyticsService(),
    registerFor: {_posthog},
  );
  gh.factory<_i14.FastConnectorService>(
    () => _i34.PocketBaseConnectorService(),
    registerFor: {_pocketbase},
  );
  gh.lazySingleton<_i11.FastFeedbackService>(
    () => _i35.FirebaseFeedbackService(),
    registerFor: {_firebase},
  );
  gh.lazySingleton<_i7.FastUserService>(
    () => _i36.SupabaseUserService(),
    registerFor: {_supabase},
  );
  gh.lazySingleton<_i16.FastChatService>(
    () => _i37.PocketbaseChatService(),
    registerFor: {_pocketbase},
  );
  gh.factory<_i14.FastConnectorService>(
    () => _i38.FirebaseConnectorService(),
    registerFor: {_firebase},
  );
  gh.singleton<_i32.FastAnalyticsService>(
    () => _i39.AmplitudeAnalyticsService(),
    registerFor: {_amplitude},
  );
  gh.singleton<_i40.SettingsService>(() => _i40.SettingsService());
  return getIt;
}

class _$RegisterModule extends _i41.RegisterModule {}
