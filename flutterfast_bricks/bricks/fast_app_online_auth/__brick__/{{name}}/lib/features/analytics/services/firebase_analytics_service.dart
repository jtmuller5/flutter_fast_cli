import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:{{ name }}/app/get_it.dart';
import 'package:{{ name }}/features/analytics/services/fast_analytics_service.dart';
import 'package:{{ name }}/features/shared/utils/recase.dart';
import 'package:injectable/injectable.dart';

@fanalytics
@Singleton(as: FastAnalyticsService)
class FirebaseAnalyticsService extends FastAnalyticsService {
  FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  @override
  Future<void> initialize() {
    return Future.value();
  }

  @override
  void logEvent(String eventName, {Map<String, dynamic>? eventProperties}) {
    analytics.logEvent(name: ReCase(eventName).snakeCase, parameters: eventProperties);
  }

  @override
  void updateUserId(String? userId) {
    analytics.setUserId(id: userId);
  }

  @override
  void updateUserProperties(Map<String, dynamic> userProperties, {bool setOnce = false}) {
    userProperties.forEach((key, value) {
      analytics.setUserProperty(name: key, value: value);
    });
  }

  @override
  void updateVersionId(String? versionId) {
    analytics.setUserProperty(name: 'app_version', value: versionId);
  }
}
