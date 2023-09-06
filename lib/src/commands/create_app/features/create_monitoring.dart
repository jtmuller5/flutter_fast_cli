import 'dart:io';

import 'package:flutter_fast_cli/src/commands/create_app/features/utils.dart';
import 'package:flutter_fast_cli/src/commands/strings.dart';

Future<void> createMonitoring(String appName) async {
  Directory monitoringServicesDirectory;
  Directory monitoringUiDirectory;
  Directory monitoringModelsDirectory;

  (monitoringModelsDirectory, monitoringServicesDirectory, monitoringUiDirectory) = await createFeature('monitoring');

  await Directory('features/monitoring/ui/feedback').create(recursive: true);

  File feedbackViewFile = File('${monitoringUiDirectory.path}/feedback/feedback_view.dart');
  await feedbackViewFile.writeAsString(getFeedbackViewText(appName), mode: FileMode.write);

  File feedbackViewModelFile = File('${monitoringUiDirectory.path}/feedback/feedback_view_model.dart');
  await feedbackViewModelFile.writeAsString(getFeedbackViewModelText(appName), mode: FileMode.write);

  File analyticsServiceFile = File('${monitoringServicesDirectory.path}/analytics_service.dart');
  await analyticsServiceFile.writeAsString(getAnalyticsServiceText(appName), mode: FileMode.write);

  File fastAnalyticsServiceFile = File('${monitoringServicesDirectory.path}/fast_analytics_service.dart');
  await fastAnalyticsServiceFile.writeAsString(getFastAnalyticsServiceText(appName), mode: FileMode.write);

  File crashServiceFile = File('${monitoringServicesDirectory.path}/crash_service.dart');
  await crashServiceFile.writeAsString(getCrashServiceText(appName), mode: FileMode.write);

  File fastCrashServiceFile = File('${monitoringServicesDirectory.path}/fast_crash_service.dart');
  await fastCrashServiceFile.writeAsString(getFastCrashServiceText(appName), mode: FileMode.write);
}
