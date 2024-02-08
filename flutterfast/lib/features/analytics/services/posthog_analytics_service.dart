import 'package:flutterfast/features/analytics/services/fast_analytics_service.dart';
import 'package:injectable/injectable.dart';
import 'package:posthog_flutter/posthog_flutter.dart';

@Singleton(as: FastAnalyticsService)
class PosthogAnalyticsService extends FastAnalyticsService {
  @override
  Future<void> initialize() {
    // TODO: implement initialize
    throw UnimplementedError();
  }

  @override
  void logEvent(String eventName, {Map<String, dynamic>? eventProperties}) {
    Posthog().capture(
      eventName: eventName,
      properties: eventProperties,
    );
  }

  @override
  void updateUserId(String? userId) {
    if (userId != null) {
      Posthog().identify(userId: userId);
    } else {
      Posthog().reset();
    }
  }

  @override
  void updateUserProperties(Map<String, dynamic> userProperties) {
    // TODO: implement updateUserProperties
  }

  @override
  void updateVersionId(String? versionId) {
    // TODO: implement updateVersionId
  }
}
