import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:template/features/authentication/ui/forgot_password_view.dart';
import 'package:template/features/authentication/ui/profile_view.dart';
import 'package:template/features/authentication/ui/register_view.dart';
import 'package:template/features/authentication/ui/sign_in_view.dart';
import 'package:template/features/chat/ui/chat/chat_view.dart';
import 'package:template/features/feedback/ui/feedback/feedback_view.dart';
import 'package:template/features/feedback/ui/new_feedback/new_feedback_view.dart';
import 'package:template/features/home/ui/home/home_view.dart';
import 'package:template/features/home/ui/onboarding/onboarding_view.dart';
import 'package:template/features/settings/ui/settings/settings_view.dart';
import 'package:template/features/shared/utils/navigation/auth_guard.dart';

//x Subscriptions x//
import 'package:template/features/subscriptions/ui/subscription/subscription_view.dart';
//x Subscriptions x//

part 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: ('View,Route'))
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page, initial: true, guards: [AuthGuard()]),
        AutoRoute(page: OnboardingRoute.page, guards: [AuthGuard()]),
        AutoRoute(page: SignInRoute.page),
        AutoRoute(page: RegisterRoute.page),
        AutoRoute(page: ForgotPasswordRoute.page),
        AutoRoute(page: ProfileRoute.page),
        AutoRoute(page: SettingsRoute.page),
        AutoRoute(page: ChatRoute.page),
        AutoRoute(page: FeedbackRoute.page),
        AutoRoute(page: NewFeedbackRoute.page),

        //* Subscriptions *//
        AutoRoute(page: SubscriptionRoute.page),
        //* Subscriptions *//
      ];
}
