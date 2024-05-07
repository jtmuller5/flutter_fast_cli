abstract class FastAnalyticsService {
  Future<void> initialize();

  void updateUserProperties(Map<String, dynamic> userProperties, {bool setOnce = false});

  void updateUserId(String? userId);

  /// Update app version ID on the User Properties
  void updateVersionId(String? versionId);

  void logEvent(String eventName, {Map<String, dynamic>? eventProperties});
}
