import 'package:auto_route/auto_route.dart';
import 'package:flutterfast/app/router.dart';
import 'package:flutterfast/app/services.dart';

/// The guarded screen requires an authenticated user
class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if (authenticationService.loggedIn) {
      // If the user is authenticated, continue
      resolver.next(true);
    } else {
      // Otherwise, redirect to the first screen
      router.push(SignInRoute());
    }
  }
}
