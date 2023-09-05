import 'package:injectable/injectable.dart';
import 'package:template/features/monitoring/services/fast_analytics_service.dart';

@Singleton(as: FastAnalyticsService)
class AnalyticsService extends FastAnalyticsService {
  @override
  void logEvent(String eventName, {Map<String, dynamic>? eventProperties}) {

  }

}