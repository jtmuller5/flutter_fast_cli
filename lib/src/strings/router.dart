String getRouterText(String appName) {

  appName = appName.toLowerCase();
  return '''
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:$appName/features/authentication/ui/forgot_password_view.dart';
import 'package:$appName/features/authentication/ui/profile_view.dart';
import 'package:$appName/features/authentication/ui/register_view.dart';
import 'package:$appName/features/authentication/ui/sign_in_view.dart';
import 'package:$appName/features/home/ui/home/home_view.dart';
import 'package:$appName/features/home/ui/onboarding/onboarding_view.dart';
import 'package:$appName/features/settings/ui/settings/settings_view.dart';
import 'package:$appName/features/shared/utils/navigation/auth_guard.dart';
import 'package:$appName/features/subscriptions/ui/subscription/subscription_view.dart';

part 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: ('View,Route'))
class AppRouter extends _\$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page, initial: true, guards: [AuthGuard()]),
        AutoRoute(page: OnboardingRoute.page, guards: [AuthGuard()]),
        AutoRoute(page: SignInRoute.page),
        AutoRoute(page: RegisterRoute.page),
        AutoRoute(page: ForgotPasswordRoute.page),
        AutoRoute(page: ProfileRoute.page),
        AutoRoute(page: SubscriptionRoute.page),
        AutoRoute(page: SettingsRoute.page),
      ];
}
  ''';
}