import 'package:shared_preferences/shared_preferences.dart';
import 'package:{{ name }}/app/get_it.dart';
import 'package:{{ name }}/app/router.dart';
import 'package:{{ name }}/features/monitoring/services/fast_analytics_service.dart';
import 'package:{{ name }}/features/monitoring/services/fast_crash_service.dart';
import 'package:{{ name }}/features/settings/services/settings_service.dart';

//x Subscriptions x//
import 'package:{{ name }}/features/subscriptions/services/subscription_service.dart';
//x Subscriptions x//

AppRouter get router => getIt.get<AppRouter>();

FastAnalyticsService get analyticsService => getIt.get<FastAnalyticsService>();

FastCrashService get crashService => getIt.get<FastCrashService>();

//* Subscriptions *//
SubscriptionService get subscriptionService => getIt.get<SubscriptionService>();
//* Subscriptions *//

SettingsService get settingsService => getIt.get<SettingsService>();

SharedPreferences get sharedPrefs => getIt.get<SharedPreferences>();
