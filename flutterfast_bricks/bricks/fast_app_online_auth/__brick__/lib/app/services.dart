import 'package:{{ name }}/features/ab_testing/services/fast_ab_test_service.dart';
import 'package:{{ name }}/features/shared/services/navigation_service.dart';
import 'package:{{ name }}/modules/chat/services/fast_chat_service.dart';
import 'package:{{ name }}/features/shared/services/dialog_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:{{ name }}/app/get_it.dart';
import 'package:{{ name }}/app/router.dart';
import 'package:{{ name }}/features/authentication/services/authentication_service/fast_authentication_service.dart';
import 'package:{{ name }}/features/authentication/services/user_service/fast_user_service.dart';
import 'package:{{ name }}/features/feedback/services/fast_feedback_service.dart';
import 'package:{{ name }}/features/analytics/services/fast_analytics_service.dart';
import 'package:{{ name }}/features/crash/services/fast_crash_service.dart';
import 'package:{{ name }}/features/settings/services/settings_service.dart';
import 'package:{{ name }}/features/shared/services/connector_service/fast_connector_service.dart';
import 'package:{{ name }}/features/subscriptions/services/subscription_service.dart';

AppRouter get router => getIt.get<AppRouter>();

DialogService get dialogService => getIt.get<DialogService>();

FastAbTestService get abTestService => getIt.get<FastAbTestService>();

FastAnalyticsService get analyticsService => getIt.get<FastAnalyticsService>();

FastAuthenticationService get authenticationService => getIt.get<FastAuthenticationService>();

FastChatService get chatService => getIt.get<FastChatService>();

FastConnectorService get connectorService => getIt.get<FastConnectorService>();

FastCrashService get crashService => getIt.get<FastCrashService>();

FastFeedbackService get feedbackService => getIt.get<FastFeedbackService>();

FastUserService get userService => getIt.get<FastUserService>();

NavigationService get navigationService => getIt.get<NavigationService>();

SubscriptionService get subscriptionService => getIt.get<SubscriptionService>();

SettingsService get settingsService => getIt.get<SettingsService>();

SharedPreferences get sharedPrefs => getIt.get<SharedPreferences>();
