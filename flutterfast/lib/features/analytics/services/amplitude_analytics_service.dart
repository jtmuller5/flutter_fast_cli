import 'package:amplitude_flutter/amplitude.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:flutterfast/features/analytics/services/fast_analytics_service.dart';
import 'package:package_info_plus/package_info_plus.dart';

@Singleton(as: FastAnalyticsService)
class AmplitudeAnalyticsService extends FastAnalyticsService {
  final Amplitude amplitude = Amplitude.getInstance();

  @override
  void logEvent(String eventName, {Map<String, dynamic>? eventProperties}) {
    amplitude.logEvent(eventName, eventProperties: eventProperties);
  }

  @override
  Future<void> initialize() async {
    String? apiKey = const String.fromEnvironment('AMPLITUDE_API_KEY');

    if (apiKey != '') {
      await amplitude.init(const String.fromEnvironment('AMPLITUDE_API_KEY'));
    }

    if (kIsWeb) {
      PackageInfo info = await PackageInfo.fromPlatform();
      updateVersionId(info.version);
    }
  }

  @override
  void updateUserId(String? userId) {
    amplitude.setUserId(userId);
  }

  @override
  void updateUserProperties(Map<String, dynamic> userProperties) {
    amplitude.setUserProperties(userProperties);
  }

  @override
  void updateVersionId(String? versionId) {
    if (kIsWeb) {
      amplitude.setUserProperties({'version': versionId});
    }
  }
}
