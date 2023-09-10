import 'package:flutterfast/modules/chat/services/fast_chat_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutterfast/app/get_it.dart';
import 'package:flutterfast/app/router.dart';
import 'package:flutterfast/features/authentication/services/authentication_service/fast_authentication_service.dart';
import 'package:flutterfast/features/authentication/services/user_service/fast_user_service.dart';
import 'package:flutterfast/features/feedback/services/fast_feedback_service.dart';
import 'package:flutterfast/features/monitoring/services/fast_analytics_service.dart';
import 'package:flutterfast/features/monitoring/services/fast_crash_service.dart';
import 'package:flutterfast/features/settings/services/settings_service.dart';
import 'package:flutterfast/features/shared/services/connector_service/fast_connector_service.dart';

//x Subscriptions x//
import 'package:flutterfast/features/subscriptions/services/subscription_service.dart';
//x Subscriptions x//

AppRouter get router => getIt.get<AppRouter>();
FastAnalyticsService get analyticsService => getIt.get<FastAnalyticsService>();
FastAuthenticationService get authenticationService =>
    getIt.get<FastAuthenticationService>();
FastChatService get chatService => getIt.get<FastChatService>();
FastConnectorService get connectorService => getIt.get<FastConnectorService>();
FastCrashService get crashService => getIt.get<FastCrashService>();
FastFeedbackService get feedbackService => getIt.get<FastFeedbackService>();
FastUserService get userService => getIt.get<FastUserService>();

//* Subscriptions *//
SubscriptionService get subscriptionService => getIt.get<SubscriptionService>();
//* Subscriptions *//

SettingsService get settingsService => getIt.get<SettingsService>();
SharedPreferences get sharedPrefs => getIt.get<SharedPreferences>();
