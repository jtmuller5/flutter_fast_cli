import 'dart:io';

Future<void> createSettings() async {
  var featuresDirectory = Directory('features');

  var settingsDirectory = await Directory('${featuresDirectory.path}/settings').create();
  var settingsServicesDirectory = await Directory('${settingsDirectory.path}/services').create();
  var settingsUiDirectory = await Directory('${settingsDirectory.path}/ui').create();
}