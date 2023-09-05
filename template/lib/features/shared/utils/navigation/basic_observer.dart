import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class BasicObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic>? route, Route<dynamic>? previousRoute) {
    debugPrint('Basic observer - Push: (${previousRoute?.settings.name}) ==> (${route?.settings.name})');
    if (route?.settings.name != null) {}
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    debugPrint('Basic observer - Replace: (${oldRoute?.settings.name}) ==> (${newRoute?.settings.name})');
  }

  @override
  void didRemove(Route<dynamic>? route, Route<dynamic>? previousRoute) {
    debugPrint('Basic observer - Remove: (${previousRoute?.settings.name}) <== (${route?.settings.name})');
  }

  @override
  void didPop(Route<dynamic>? route, Route<dynamic>? previousRoute) {
    debugPrint('Basic observer - Pop: (${previousRoute?.settings.name}) <== (${route?.settings.name})');
  }
}
