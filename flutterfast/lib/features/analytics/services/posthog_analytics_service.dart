import 'package:flutterfast/app/get_it.dart';
import 'package:flutterfast/app/services.dart';
import 'package:flutterfast/features/analytics/services/fast_analytics_service.dart';
import 'package:injectable/injectable.dart';
import 'package:posthog_flutter/posthog_flutter.dart';

@posthog
@Singleton(as: FastAnalyticsService)
class PosthogAnalyticsService extends FastAnalyticsService {
  @override
  Future<void> initialize() {
    return Future.value();
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
    Posthog().identify(userId: authenticationService.id!, properties: userProperties);
  }

  @override
  void updateVersionId(String? versionId) {
    // TODO: implement updateVersionId
  }
}
