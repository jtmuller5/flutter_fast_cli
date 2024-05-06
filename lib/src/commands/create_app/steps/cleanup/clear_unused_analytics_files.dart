import 'dart:io';

import 'package:flutter_fast_cli/src/commands/create_app/steps/cleanup/remove_feature_from_file.dart';

Future<void> clearUnusedAnalyticsFiles(String analytics) async {
  Directory analyticsDirectory = Directory('lib/features/analytics/services');
  File amplitudeAnalyticsServiceFile = File('${analyticsDirectory.path}/amplitude_analytics_service.dart');
  File posthogAnalyticsServiceFile = File('${analyticsDirectory.path}/posthog_analytics_service.dart');

  if (analytics == 'amplitude') {
    await posthogAnalyticsServiceFile.delete();
    removeFeatureFromFile('Posthog', 'lib/main.dart');
    removeFeatureFromFile('Posthog', 'web/index.html');
    removeFeatureFromFile('Posthog', 'lib/app/get_it.dart');
  } else if (analytics == 'posthog') {
    await amplitudeAnalyticsServiceFile.delete();
    removeFeatureFromFile('Amplitude', 'lib/main.dart');
    removeFeatureFromFile('Amplitude', 'web/index.html');
    removeFeatureFromFile('Amplitude', 'lib/app/get_it.dart');
  } else {
    stdout.writeln('Unknown Analytics Plaform: $analytics');
  }
}
