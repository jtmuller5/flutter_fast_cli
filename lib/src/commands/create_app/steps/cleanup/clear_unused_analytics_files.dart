import 'dart:io';

import 'package:flutter_fast_cli/src/commands/create_app/steps/cleanup/remove_feature_from_file.dart';

Future<void> clearUnusedAnalyticsFiles(String analytics) async {
  Directory analyticsDirectory = Directory('lib/features/analytics/services');
  File amplitudeAnalyticsServiceFile = File('${analyticsDirectory.path}/amplitude_analytics_service.dart');
  File posthogAnalyticsServiceFile = File('${analyticsDirectory.path}/posthog_analytics_service.dart');

  if (analytics == 'amplitude') {
    await posthogAnalyticsServiceFile.delete();
  } else if (analytics == 'posthog') {
    await amplitudeAnalyticsServiceFile.delete();
  } else {
    stdout.writeln('Unknown Analytics Plaform: $analytics');
  }
}

Future<void> removeDependencies(String tag) async {
  var pubspec = await File('pubspec.yaml').readAsString();
  var modifiedContent = pubspec.replaceAll('#* $tag *#', '');
  await File('pubspec.yaml').writeAsString(modifiedContent);
}

Future<void> deleteFirebaseFiles() async {
  await removeFeatureFromFile('Chat', 'lib/app/router.dart');
  await removeFeatureFromFile('Chat', 'lib/app/services.dart');

  Directory chatLibDirectory = Directory('lib/modules/chat');
  if (await chatLibDirectory.exists()) {
    await chatLibDirectory.delete(recursive: true);
  }

  Directory rowyDirectory = Directory('lib/features/shared/models/rowy');

  if (await rowyDirectory.exists()) {
    await rowyDirectory.delete(recursive: true);
  }

  Directory firebaseDirectory = Directory('lib/features/shared/models/firebase');

  if (await firebaseDirectory.exists()) {
    await firebaseDirectory.delete(recursive: true);
  }

  File firebaseOptions = File('lib/firebase_options.dart');
  if (await firebaseOptions.exists()) {
    await firebaseOptions.delete();
  }
}
