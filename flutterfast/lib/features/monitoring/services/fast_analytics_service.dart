abstract class FastAnalyticsService {
  Future<void> initialize();

  void logEvent(String eventName, {Map<String, dynamic>? eventProperties});
}
