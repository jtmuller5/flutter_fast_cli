import 'dart:io';

Future<void> updateAnalyticsEnvironment(String analytics) async {
  File analyticsEnvironment = File('lib/app/get_it.dart');

  Map<String, String> analyticsMap = {
    'amplitude': "amplitude",
    'posthog': "posthog)",
    'firebase': "fanalytics",
  };

  String analyticsValue = analyticsMap[analytics] ?? "amplitude";

  try {
    var content = await analyticsEnvironment.readAsString();

    var modifiedContent = content.replaceAll("defaultValue: 'amplitude'),", "defaultValue: '$analyticsValue'),");

    await analyticsEnvironment.writeAsString(modifiedContent);
  } catch (e) {
    stderr.writeln(e);
  }
}
