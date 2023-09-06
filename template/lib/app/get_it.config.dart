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
import 'package:shared_preferences/shared_preferences.dart' as _i15;

import '../features/authentication/services/fast_authentication_service.dart'
    as _i5;
import '../features/authentication/services/fast_user_service.dart' as _i13;
import '../features/authentication/services/firebase_authentication_service.dart'
    as _i6;
import '../features/authentication/services/firebase_user_service.dart' as _i14;
import '../features/chat/services/chat_service.dart' as _i8;
import '../features/chat/services/fast_chat_service.dart' as _i7;
import '../features/feedback/services/fast_feedback_service.dart' as _i11;
import '../features/feedback/services/firebase_feedback_service.dart' as _i12;
import '../features/monitoring/services/amplitude_analytics_service.dart'
    as _i4;
import '../features/monitoring/services/crash_service.dart' as _i10;
import '../features/monitoring/services/fast_analytics_service.dart' as _i3;
import '../features/monitoring/services/fast_crash_service.dart' as _i9;
import '../features/settings/services/settings_service.dart' as _i17;
import '../features/shared/services/modules.dart' as _i18;
import '../features/subscriptions/services/subscription_service.dart' as _i16;

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
      _i6.FirebaseAuthenticationService());
  gh.lazySingleton<_i7.FastChatService>(() => _i8.ChatService());
  gh.singleton<_i9.FastCrashService>(_i10.CrashService());
  gh.lazySingleton<_i11.FastFeedbackService>(
      () => _i12.FirebaseFeedbackService());
  gh.lazySingleton<_i13.FastUserService>(() => _i14.FirebaseUserService());
  await gh.factoryAsync<_i15.SharedPreferences>(
    () => registerModule.sharedPrefs,
    preResolve: true,
  );
  gh.singleton<_i16.SubscriptionService>(_i16.SubscriptionService());
  gh.singleton<_i17.SettingsService>(_i17.SettingsService());
  return getIt;
}

class _$RegisterModule extends _i18.RegisterModule {}
