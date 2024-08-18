import 'package:auto_route/auto_route.dart';
import 'package:flutterfast_offline/features/home/ui/home/home_view.dart';

//x Subscriptions x//
import 'package:flutterfast_offline/features/subscriptions/ui/subscription/subscription_view.dart';
//x Subscriptions x//

import 'package:flutterfast_offline/features/home/ui/onboarding/onboarding_view.dart';
import 'package:flutterfast_offline/features/settings/ui/settings/settings_view.dart';
import 'package:flutterfast_offline/modules/notes/ui/notes/notes_view.dart';
import 'package:flutterfast_offline/modules/rss/ui/rss/rss_view.dart';

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
