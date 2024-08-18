import 'package:flutter/foundation.dart';
import 'package:universal_html/html.dart' as html;

abstract class FastAbTestService {
  Future<void> initialize();

  Future<bool> isFeatureEnabled(ConfigValue feature);

  Future<String> getStringValue(ConfigValue key);

  /// Determine if a feature is enabled on web
  /// Useful for QA testing on/off features
  /// Turn a feature on manually by setting a cookie with the feature name to 'true'
  /// Turn a feature off manually by setting a cookie with the feature name to 'false'
  ///
  /// Example:
  ///   show_onboarding=true
  Future<bool> isFeatureEnabledWeb(ConfigValue feature) async {
    // get value from cookies
    if (kIsWeb) {
      final cookies = html.document.cookie?.split('; ') ?? [];
      for (var cookie in cookies) {
        final cookieParts = cookie.split('=');
        if (cookieParts.length == 2 && cookieParts[0] == feature.label) {
          if (cookieParts[1] == 'true') {
            return true;
          } else {
            return false;
          }
        }
      }
      return false;
    }

    return isFeatureEnabled(feature);
  }
}

enum ConfigValue {
  showOnboarding('show_onboarding', defaultValue: true),
  showNotifications('show_notifications', defaultValue: true);

  const ConfigValue(this.label, {this.defaultValue});

  final String label;
  final dynamic defaultValue;
}
