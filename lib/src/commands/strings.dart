import 'dart:io';

/// Root
String getPubspecText(String appName) => File('../template/pubspec.yaml').readAsStringSync().replaceAll('template', appName.toLowerCase());
String getAnalysisOptionsText() => File('../template/analysis_options.yaml').readAsStringSync();
String getGitIgnoreText() => File('../template/.gitignore').readAsStringSync();
String getBuildYamlText() => File('../template/build.yaml').readAsStringSync();
String getConfigText() => File('../template/assets/config.json').readAsStringSync();
String getReadmeText(String appName) => File('../template/README.md').readAsStringSync().replaceAll('template', appName.toLowerCase());

/// App
String getConstantsText() => File('../../template/lib/app/constants.dart').readAsStringSync();
String getServicesText(String appName) => File('../../template/lib/app/services.dart').readAsStringSync().replaceAll('template', appName.toLowerCase());
String getItText() => File('../../template/lib/app/get_it.dart').readAsStringSync();
String getTextThemeText(String appName) => File('../../template/lib/app/text_theme.dart').readAsStringSync().replaceAll('template', appName.toLowerCase());
String getThemeText() => File('../../template/lib/app/theme.dart').readAsStringSync();
String getRouterText(String appName) => File('../../template/lib/app/router.dart').readAsStringSync().replaceAll('template', appName.toLowerCase());

/// Authentication
String getFastUserText(String appName) => File('../../template/lib/features/authentication/models/fast_user.dart').readAsStringSync().replaceAll('template', appName.toLowerCase());
String getAuthenticationServiceText(String appName) => File('../../template/lib/features/authentication/services/authentication_service.dart').readAsStringSync().replaceAll('template', appName.toLowerCase());
String getFastAuthenticationServiceText(String appName) => File('../../template/lib/features/authentication/services/fast_authentication_service.dart').readAsStringSync().replaceAll('template', appName.toLowerCase());
String getUserServiceText(String appName) => File('../../template/lib/features/authentication/services/user_service.dart').readAsStringSync().replaceAll('template', appName.toLowerCase());
String getFastUserServiceText(String appName) => File('../../template/lib/features/authentication/services/fast_user_service.dart').readAsStringSync().replaceAll('template', appName.toLowerCase());
String getForgotPasswordViewText(String appName) => File('../../template/lib/features/authentication/ui/forgot_password_view.dart').readAsStringSync().replaceAll('template', appName.toLowerCase());
String getSignInViewText(String appName) => File('../../template/lib/features/authentication/ui/sign_in_view.dart').readAsStringSync().replaceAll('template', appName.toLowerCase());
String getRegisterViewText(String appName) => File('../../template/lib/features/authentication/ui/register_view.dart').readAsStringSync().replaceAll('template', appName.toLowerCase());
String getProfileViewText(String appName) => File('../../template/lib/features/authentication/ui/profile_view.dart').readAsStringSync().replaceAll('template', appName.toLowerCase());

/// Home
String getHomeViewText(String appName) => File('../../template/lib/features/home/ui/home/home_view.dart').readAsStringSync().replaceAll('template', appName.toLowerCase());
String getHomeViewModelText() => File('../../template/lib/features/home/ui/home/home_view_model.dart').readAsStringSync();
String getDrawerText(String appName) => File('../../template/lib/features/home/ui/home/widgets/drawer.dart').readAsStringSync().replaceAll('template', appName.toLowerCase());
String getOnboardingViewText(String appName) => File('../../template/lib/features/home/ui/onboarding/onboarding_view.dart').readAsStringSync().replaceAll('template', appName.toLowerCase());
String getOnboardingViewModelText() => File('../../template/lib/features/home/ui/onboarding/onboarding_view_model.dart').readAsStringSync();
String getPageOneText() => File('../../template/lib/features/home/ui/onboarding/widgets/page_one.dart').readAsStringSync();
String getPageTwoText() => File('../../template/lib/features/home/ui/onboarding/widgets/page_two.dart').readAsStringSync();
String getPageThreeText() => File('../../template/lib/features/home/ui/onboarding/widgets/page_three.dart').readAsStringSync();
String getChatServiceText(String appName) => File('../../template/lib/features/home/services/chat_service.dart').readAsStringSync().replaceAll('template', appName.toLowerCase());
String getFastChatServiceText(String appName) => File('../../template/lib/features/home/services/fast_chat_service.dart').readAsStringSync().replaceAll('template', appName.toLowerCase());
String getChatViewText(String appName) => File('../../template/lib/features/home/ui/chat/chat_view.dart').readAsStringSync().replaceAll('template', appName.toLowerCase());
String getChatViewModelText(String appName) => File('../../template/lib/features/home/ui/chat/chat_view_model.dart').readAsStringSync().replaceAll('template', appName.toLowerCase());
String getAiChat(String appName) => File('../../template/lib/features/home/ui/chat/widgets/ai_chat.dart').readAsStringSync().replaceAll('template', appName.toLowerCase());
String getMessageBubble(String appName) => File('../../template/lib/features/home/ui/chat/widgets/message_bubble.dart').readAsStringSync().replaceAll('template', appName.toLowerCase());
String getMessageText(String appName) => File('../../template/lib/features/home/models/message.dart').readAsStringSync().replaceAll('template', appName.toLowerCase());
String getResponseStatusText(String appName) => File('../../template/lib/features/home/models/response_status.dart').readAsStringSync().replaceAll('template', appName.toLowerCase());

/// Monitoring
String getAnalyticsServiceText(String appName) => File('../../template/lib/features/monitoring/services/analytics_service.dart').readAsStringSync().replaceAll('template', appName.toLowerCase());
String getCrashServiceText(String appName) => File('../../template/lib/features/monitoring/services/crash_service.dart').readAsStringSync().replaceAll('template', appName.toLowerCase());
String getFastAnalyticsServiceText(String appName) => File('../../template/lib/features/monitoring/services/fast_analytics_service.dart').readAsStringSync().replaceAll('template', appName.toLowerCase());
String getFastCrashServiceText(String appName) => File('../../template/lib/features/monitoring/services/fast_crash_service.dart').readAsStringSync().replaceAll('template', appName.toLowerCase());
String getFeedbackViewText(String appName) => File('../../template/lib/features/monitoring/ui/feedback/feedback_view.dart').readAsStringSync().replaceAll('template', appName.toLowerCase());
String getFeedbackViewModelText(String appName) => File('../../template/lib/features/monitoring/ui/feedback/feedback_view_model.dart').readAsStringSync();

/// Settings
String getSettingsViewText(String appName) => File('../../template/lib/features/settings/ui/settings/settings_view.dart').readAsStringSync().replaceAll('template', appName.toLowerCase());
String getSettingsViewModelText(String appName) => File('../../template/lib/features/settings/ui/settings/settings_view_model.dart').readAsStringSync();
String getSettingsServiceText(String appName) => File('../../template/lib/features/settings/services/settings_service.dart').readAsStringSync().replaceAll('template', appName.toLowerCase());

/// Shared
String getModulesText() => File('../../template/lib/features/shared/services/modules.dart').readAsStringSync();
String getTimeServiceText() => File('../../template/lib/features/shared/services/time_service.dart').readAsStringSync();
String getAppLogoText() => File('../../template/lib/features/shared/ui/app_logo.dart').readAsStringSync();
String getUtilsText() => File('../../template/lib/features/shared/utils/json/utils.dart').readAsStringSync();
String getAuthGuardText(String appName) => File('../../template/lib/features/shared/utils/navigation/auth_guard.dart').readAsStringSync().replaceAll('template', appName.toLowerCase());
String getBasicObserverText(String appName) => File('../../template/lib/features/shared/utils/navigation/basic_observer.dart').readAsStringSync().replaceAll('template', appName.toLowerCase());

/// Subscriptions
String getSubscriptionViewText(String appName) => File('../../template/lib/features/subscriptions/ui/subscription/subscription_view.dart').readAsStringSync().replaceAll('template', appName.toLowerCase());
String getSubscriptionViewModelText(String appName) => File('../../template/lib/features/subscriptions/ui/subscription/subscription_view_model.dart').readAsStringSync().replaceAll('template', appName.toLowerCase());
String getPlanCardText(String appName) => File('../../template/lib/features/subscriptions/ui/subscription/widgets/plan_card.dart').readAsStringSync().replaceAll('template', appName.toLowerCase());
String getFeatureCardText(String appName) => File('../../template/lib/features/subscriptions/ui/subscription/widgets/feature_card.dart').readAsStringSync().replaceAll('template', appName.toLowerCase());
String getSubscriptionServiceText(String appName) => File('../../template/lib/features/subscriptions/services/subscription_service.dart').readAsStringSync().replaceAll('template', appName.toLowerCase());

/// Main
String getMainText(String appName) => File('../../template/lib/main.dart').readAsStringSync().replaceAll('template', appName.toLowerCase());

/// Fastlane
String getAndroidFastfileText() => File('../../template/android/fastlane/Fastfile').readAsStringSync();
String getAndroidAppfileText() => File('../../template/android/fastlane/Appfile').readAsStringSync();
String getIOSFastfileText() => File('../../template/ios/fastlane/Fastfile').readAsStringSync();
String getIOSAppfileText() => File('../../template/ios/fastlane/Appfile').readAsStringSync();