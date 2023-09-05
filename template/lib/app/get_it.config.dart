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
import 'package:shared_preferences/shared_preferences.dart' as _i13;

import '../features/authentication/services/authentication_service.dart' as _i6;
import '../features/authentication/services/fast_authentication_service.dart'
    as _i5;
import '../features/authentication/services/fast_user_service.dart' as _i11;
import '../features/authentication/services/user_service.dart' as _i12;
import '../features/monitoring/services/analytics_service.dart' as _i4;
import '../features/monitoring/services/crash_service.dart' as _i8;
import '../features/monitoring/services/fast_analytics_service.dart' as _i3;
import '../features/monitoring/services/fast_crash_service.dart' as _i7;
import '../features/settings/services/settings_service.dart' as _i14;
import '../features/shared/services/modules.dart' as _i15;
import '../features/subscriptions/services/fast_subscription_service.dart'
    as _i9;
import '../features/subscriptions/services/subscription_service.dart' as _i10;

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
  gh.singleton<_i3.FastAnalyticsService>(_i4.AnalyticsService());
  gh.singleton<_i5.FastAuthenticationService>(
      _i6.FirebaseAuthenticationService());
  gh.singleton<_i7.FastCrashService>(_i8.CrashService());
  gh.singleton<_i9.FastSubscriptionService>(_i10.SubscriptionService());
  gh.lazySingleton<_i11.FastUserService>(() => _i12.UserService());
  await gh.factoryAsync<_i13.SharedPreferences>(
    () => registerModule.sharedPrefs,
    preResolve: true,
  );
  gh.singleton<_i14.SettingsService>(_i14.SettingsService());
  return getIt;
}

class _$RegisterModule extends _i15.RegisterModule {}
