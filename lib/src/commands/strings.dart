import 'dart:io';

String templatePath = '../template';

/// Root
String getPubspecText(String appName) => File('$templatePath/pubspec.yaml').readAsStringSync().replaceAll('template', appName.toLowerCase());
String getAnalysisOptionsText() => File('$templatePath/analysis_options.yaml').readAsStringSync();
String getGitIgnoreText() => File('$templatePath/.gitignore').readAsStringSync();
String getBuildYamlText() => File('$templatePath/build.yaml').readAsStringSync();
String getConfigText() => File('$templatePath/assets/config.json').readAsStringSync();
String getReadmeText(String appName) => File('$templatePath/README.md').readAsStringSync().replaceAll('template', appName.toLowerCase());

/// App
String getConstantsText() => File('$templatePath/lib/app/constants.dart').readAsStringSync();
String getServicesText(String appName) => File('$templatePath/lib/app/services.dart').readAsStringSync().replaceAll('template', appName.toLowerCase());
String getItText() => File('$templatePath/lib/app/get_it.dart').readAsStringSync();
String getTextThemeText(String appName) => File('$templatePath/lib/app/text_theme.dart').readAsStringSync().replaceAll('template', appName.toLowerCase());
String getThemeText() => File('$templatePath/lib/app/theme.dart').readAsStringSync();
String getRouterText(String appName) => File('$templatePath/lib/app/router.dart').readAsStringSync().replaceAll('template', appName.toLowerCase());

/// Authentication
String getFastUserText(String appName) => File('$templatePath/lib/features/authentication/models/fast_user.dart').readAsStringSync().replaceAll('template', appName.toLowerCase());
String getAuthenticationServiceText(String appName) => File('$templatePath/lib/features/authentication/services/firebase_authentication_service.dart').readAsStringSync().replaceAll('template', appName.toLowerCase());
String getFastAuthenticationServiceText(String appName) => File('$templatePath/lib/features/authentication/services/fast_authentication_service.dart').readAsStringSync().replaceAll('template', appName.toLowerCase());
String getUserServiceText(String appName) => File('$templatePath/lib/features/authentication/services/firebase_user_service.dart').readAsStringSync().replaceAll('template', appName.toLowerCase());
String getFastUserServiceText(String appName) => File('$templatePath/lib/features/authentication/services/fast_user_service.dart').readAsStringSync().replaceAll('template', appName.toLowerCase());
String getForgotPasswordViewText(String appName) => File('$templatePath/lib/features/authentication/ui/forgot_password_view.dart').readAsStringSync().replaceAll('template', appName.toLowerCase());
String getSignInViewText(String appName) => File('$templatePath/lib/features/authentication/ui/sign_in_view.dart').readAsStringSync().replaceAll('template', appName.toLowerCase());
String getRegisterViewText(String appName) => File('$templatePath/lib/features/authentication/ui/register_view.dart').readAsStringSync().replaceAll('template', appName.toLowerCase());
String getProfileViewText(String appName) => File('$templatePath/lib/features/authentication/ui/profile_view.dart').readAsStringSync().replaceAll('template', appName.toLowerCase());

/// Home
String getHomeViewText(String appName) => File('$templatePath/lib/features/home/ui/home/home_view.dart').readAsStringSync().replaceAll('template', appName.toLowerCase());
String getHomeViewModelText() => File('$templatePath/lib/features/home/ui/home/home_view_model.dart').readAsStringSync();
String getDrawerText(String appName) => File('$templatePath/lib/features/home/ui/home/widgets/drawer.dart').readAsStringSync().replaceAll('template', appName.toLowerCase());
String getOnboardingViewText(String appName) => File('$templatePath/lib/features/home/ui/onboarding/onboarding_view.dart').readAsStringSync().replaceAll('template', appName.toLowerCase());
String getOnboardingViewModelText() => File('$templatePath/lib/features/home/ui/onboarding/onboarding_view_model.dart').readAsStringSync();
String getPageOneText() => File('$templatePath/lib/features/home/ui/onboarding/widgets/page_one.dart').readAsStringSync();
String getPageTwoText() => File('$templatePath/lib/features/home/ui/onboarding/widgets/page_two.dart').readAsStringSync();
String getPageThreeText() => File('$templatePath/lib/features/home/ui/onboarding/widgets/page_three.dart').readAsStringSync();
String getChatServiceText(String appName) => File('$templatePath/lib/features/home/services/chat_service.dart').readAsStringSync().replaceAll('template', appName.toLowerCase());
String getFastChatServiceText(String appName) => File('$templatePath/lib/features/home/services/fast_chat_service.dart').readAsStringSync().replaceAll('template', appName.toLowerCase());
String getChatViewText(String appName) => File('$templatePath/lib/features/home/ui/chat/chat_view.dart').readAsStringSync().replaceAll('template', appName.toLowerCase());
String getChatViewModelText(String appName) => File('$templatePath/lib/features/home/ui/chat/chat_view_model.dart').readAsStringSync().replaceAll('template', appName.toLowerCase());
String getAiChat(String appName) => File('$templatePath/lib/features/home/ui/chat/widgets/ai_chat.dart').readAsStringSync().replaceAll('template', appName.toLowerCase());
String getMessageBubble(String appName) => File('$templatePath/lib/features/home/ui/chat/widgets/message_bubble.dart').readAsStringSync().replaceAll('template', appName.toLowerCase());
String getMessageText(String appName) => File('$templatePath/lib/features/home/models/message.dart').readAsStringSync().replaceAll('template', appName.toLowerCase());
String getResponseStatusText(String appName) => File('$templatePath/lib/features/home/models/response_status.dart').readAsStringSync().replaceAll('template', appName.toLowerCase());

/// Monitoring
String getAnalyticsServiceText(String appName) => File('$templatePath/lib/features/monitoring/services/amplitude_analytics_service.dart').readAsStringSync().replaceAll('template', appName.toLowerCase());
String getCrashServiceText(String appName) => File('$templatePath/lib/features/monitoring/services/crash_service.dart').readAsStringSync().replaceAll('template', appName.toLowerCase());
String getFastAnalyticsServiceText(String appName) => File('$templatePath/lib/features/monitoring/services/fast_analytics_service.dart').readAsStringSync().replaceAll('template', appName.toLowerCase());
String getFastCrashServiceText(String appName) => File('$templatePath/lib/features/monitoring/services/fast_crash_service.dart').readAsStringSync().replaceAll('template', appName.toLowerCase());
String getFeedbackViewText(String appName) => File('$templatePath/lib/features/monitoring/ui/feedback/feedback_view.dart').readAsStringSync().replaceAll('template', appName.toLowerCase());
String getFeedbackViewModelText(String appName) => File('$templatePath/lib/features/monitoring/ui/feedback/feedback_view_model.dart').readAsStringSync();

/// Settings
String getSettingsViewText(String appName) => File('$templatePath/lib/features/settings/ui/settings/settings_view.dart').readAsStringSync().replaceAll('template', appName.toLowerCase());
String getSettingsViewModelText(String appName) => File('$templatePath/lib/features/settings/ui/settings/settings_view_model.dart').readAsStringSync();
String getSettingsServiceText(String appName) => File('$templatePath/lib/features/settings/services/settings_service.dart').readAsStringSync().replaceAll('template', appName.toLowerCase());

/// Shared
String getModulesText() => File('$templatePath/lib/features/shared/services/modules.dart').readAsStringSync();
String getTimeServiceText() => File('$templatePath/lib/features/shared/services/time_service.dart').readAsStringSync();
String getAppLogoText() => File('$templatePath/lib/features/shared/ui/app_logo.dart').readAsStringSync();
String getUtilsText() => File('$templatePath/lib/features/shared/utils/json/utils.dart').readAsStringSync();
String getAuthGuardText(String appName) => File('$templatePath/lib/features/shared/utils/navigation/auth_guard.dart').readAsStringSync().replaceAll('template', appName.toLowerCase());
String getBasicObserverText(String appName) => File('$templatePath/lib/features/shared/utils/navigation/basic_observer.dart').readAsStringSync().replaceAll('template', appName.toLowerCase());

/// Subscriptions
String getSubscriptionViewText(String appName) => File('$templatePath/lib/features/subscriptions/ui/subscription/subscription_view.dart').readAsStringSync().replaceAll('template', appName.toLowerCase());
String getSubscriptionViewModelText(String appName) => File('$templatePath/lib/features/subscriptions/ui/subscription/subscription_view_model.dart').readAsStringSync().replaceAll('template', appName.toLowerCase());
String getPlanCardText(String appName) => File('$templatePath/lib/features/subscriptions/ui/subscription/widgets/plan_card.dart').readAsStringSync().replaceAll('template', appName.toLowerCase());
String getFeatureCardText(String appName) => File('$templatePath/lib/features/subscriptions/ui/subscription/widgets/feature_card.dart').readAsStringSync().replaceAll('template', appName.toLowerCase());
String getSubscriptionServiceText(String appName) => File('$templatePath/lib/features/subscriptions/services/subscription_service.dart').readAsStringSync().replaceAll('template', appName.toLowerCase());

/// Main
String getMainText(String appName) => File('$templatePath/lib/main.dart').readAsStringSync().replaceAll('template', appName.toLowerCase());

/// Fastlane
String getAndroidFastfileText() => File('$templatePath/android/fastlane/Fastfile').readAsStringSync();
String getAndroidAppfileText() => File('$templatePath/android/fastlane/Appfile').readAsStringSync();
String getIOSFastfileText() => File('$templatePath/ios/fastlane/Fastfile').readAsStringSync();
String getIOSAppfileText() => File('$templatePath/ios/fastlane/Appfile').readAsStringSync();

/// Android
String getAndroidBuildGradleText() => File('$templatePath/android/app/build.gradle').readAsStringSync();