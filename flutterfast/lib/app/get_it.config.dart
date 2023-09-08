// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i21;

import '../features/authentication/services/authentication_service/fast_authentication_service.dart'
    as _i5;
import '../features/authentication/services/authentication_service/firebase_authentication_service.dart'
    as _i6;
import '../features/authentication/services/authentication_service/supabase_authentication_service.dart'
    as _i7;
import '../features/authentication/services/user_service/fast_user_service.dart'
    as _i18;
import '../features/authentication/services/user_service/firebase_user_service.dart'
    as _i20;
import '../features/authentication/services/user_service/supabase_user_service.dart'
    as _i19;
import '../features/feedback/services/fast_feedback_service.dart' as _i15;
import '../features/feedback/services/firebase_feedback_service.dart' as _i16;
import '../features/feedback/services/supabase_feedback_service.dart' as _i17;
import '../features/monitoring/services/amplitude_analytics_service.dart'
    as _i4;
import '../features/monitoring/services/crash_service.dart' as _i14;
import '../features/monitoring/services/fast_analytics_service.dart' as _i3;
import '../features/monitoring/services/fast_crash_service.dart' as _i13;
import '../features/settings/services/settings_service.dart' as _i23;
import '../features/shared/services/connector_service/fast_connector_service.dart'
    as _i10;
import '../features/shared/services/connector_service/firebase_connector_service.dart'
    as _i12;
import '../features/shared/services/connector_service/supabase_connector_service.dart'
    as _i11;
import '../features/shared/services/modules.dart' as _i24;
import '../features/subscriptions/services/subscription_service.dart' as _i22;
import '../modules/chat/services/chat_service.dart' as _i9;
import '../modules/chat/services/fast_chat_service.dart' as _i8;

const String _firebase = 'firebase';
const String _supabase = 'supabase';

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
  gh.singleton<_i3.FastAnalyticsService>(_i4.AmplitudeAnalyticsService());
  gh.singleton<_i5.FastAuthenticationService>(
    _i6.FirebaseAuthenticationService(),
    registerFor: {_firebase},
  );
  gh.singleton<_i5.FastAuthenticationService>(
    _i7.SupabaseAuthenticationService(),
    registerFor: {_supabase},
  );
  gh.lazySingleton<_i8.FastChatService>(() => _i9.ChatService());
  gh.factory<_i10.FastConnectorService>(
    () => _i11.SupabaseConnectorService(),
    registerFor: {_supabase},
  );
  gh.factory<_i10.FastConnectorService>(
    () => _i12.FirebaseConnectorService(),
    registerFor: {_firebase},
  );
  gh.singleton<_i13.FastCrashService>(_i14.CrashService());
  gh.lazySingleton<_i15.FastFeedbackService>(
    () => _i16.FirebaseFeedbackService(),
    registerFor: {_firebase},
  );
  gh.lazySingleton<_i15.FastFeedbackService>(
    () => _i17.SupabaseFeedbackService(),
    registerFor: {_supabase},
  );
  gh.lazySingleton<_i18.FastUserService>(
    () => _i19.SupabaseUserService(),
    registerFor: {_supabase},
  );
  gh.lazySingleton<_i18.FastUserService>(
    () => _i20.FirebaseUserService(),
    registerFor: {_firebase},
  );
  await gh.factoryAsync<_i21.SharedPreferences>(
    () => registerModule.sharedPrefs,
    preResolve: true,
  );
  gh.singleton<_i22.SubscriptionService>(_i22.SubscriptionService());
  gh.singleton<_i23.SettingsService>(_i23.SettingsService());
  return getIt;
}

class _$RegisterModule extends _i24.RegisterModule {}
