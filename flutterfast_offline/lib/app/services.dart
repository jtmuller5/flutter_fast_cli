import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutterfast/app/get_it.dart';
import 'package:flutterfast/app/router.dart';
import 'package:flutterfast/features/monitoring/services/fast_analytics_service.dart';
import 'package:flutterfast/features/monitoring/services/fast_crash_service.dart';
import 'package:flutterfast/features/settings/services/settings_service.dart';

//x Subscriptions x//
import 'package:flutterfast/features/subscriptions/services/subscription_service.dart';
//x Subscriptions x//

AppRouter get router => getIt.get<AppRouter>();

FastAnalyticsService get analyticsService => getIt.get<FastAnalyticsService>();

FastCrashService get crashService => getIt.get<FastCrashService>();

//* Subscriptions *//
SubscriptionService get subscriptionService => getIt.get<SubscriptionService>();
//* Subscriptions *//

SettingsService get settingsService => getIt.get<SettingsService>();

SharedPreferences get sharedPrefs => getIt.get<SharedPreferences>();
