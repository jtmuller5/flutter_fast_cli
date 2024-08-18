import 'package:auto_route/auto_route.dart';
import 'package:{{ name }}/features/home/ui/home/home_view.dart';

//x Subscriptions x//
import 'package:{{ name }}/features/subscriptions/ui/subscription/subscription_view.dart';
//x Subscriptions x//

import 'package:{{ name }}/features/home/ui/onboarding/onboarding_view.dart';
import 'package:{{ name }}/features/settings/ui/settings/settings_view.dart';
import 'package:{{ name }}/modules/notes/ui/notes/notes_view.dart';
import 'package:{{ name }}/modules/rss/ui/rss/rss_view.dart';

part 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: ('View,Route'))
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page, initial: true),
        AutoRoute(page: OnboardingRoute.page),
        AutoRoute(page: SettingsRoute.page),
        AutoRoute(page: RssRoute.page),

        //* Subscriptions *//
        AutoRoute(page: SubscriptionRoute.page),
        //* Subscriptions *//
      ];
}
