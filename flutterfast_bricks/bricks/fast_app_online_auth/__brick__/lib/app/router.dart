import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:{{ name }}/features/authentication/ui/forgot_password_view.dart';
import 'package:{{ name }}/features/authentication/ui/profile_view.dart';
import 'package:{{ name }}/features/authentication/ui/register_view.dart';
import 'package:{{ name }}/features/authentication/ui/reset_password_view.dart';
import 'package:{{ name }}/features/authentication/ui/sign_in_view.dart';
import 'package:{{ name }}/features/feedback/ui/feedback/feedback_view.dart';
import 'package:{{ name }}/features/feedback/ui/new_feedback/new_feedback_view.dart';
import 'package:{{ name }}/features/home/ui/home/home_view.dart';

//x Subscriptions x//
import 'package:{{ name }}/features/subscriptions/ui/subscription/subscription_view.dart';
//x Subscriptions x//

import 'package:{{ name }}/features/onboarding/onboarding_view.dart';
import 'package:{{ name }}/features/settings/ui/settings/settings_view.dart';
import 'package:{{ name }}/features/shared/utils/navigation/auth_guard.dart';
import 'package:{{ name }}/modules/rss/ui/rss/rss_view.dart';

//x Chat x//
import 'package:{{ name }}/modules/chat/ui/chat/chat_view.dart';
//x Chat x//

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
        AutoRoute(page: ResetPasswordRoute.page, path: '/reset-password'),
        AutoRoute(page: ProfileRoute.page),
        AutoRoute(page: SettingsRoute.page),

        //* Chat *//
        AutoRoute(page: ChatRoute.page),
        //* Chat *//

        AutoRoute(page: FeedbackRoute.page),
        AutoRoute(page: NewFeedbackRoute.page),
        AutoRoute(page: RssRoute.page),

        //* Subscriptions *//
        AutoRoute(page: SubscriptionRoute.page),
        //* Subscriptions *//

        // New Routes
      ];
}
