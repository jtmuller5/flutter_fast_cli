import 'dart:io';

import 'package:flutter_fast_cli/src/commands/create_app/features/utils.dart';
import 'package:flutter_fast_cli/src/commands/strings.dart';

Future<void> createSettings(String appName) async {
  Directory settingsServicesDirectory;
  Directory settingsUiDirectory;
  Directory settingsModelsDirectory;

  (settingsModelsDirectory, settingsServicesDirectory, settingsUiDirectory) = await createFeature('settings');

  await Directory('features/settings/ui/settings').create(recursive: true);

  File settingsViewFile = File('${settingsUiDirectory.path}/settings/settings_view.dart');
  await settingsViewFile.writeAsString(getSettingsViewText(appName), mode: FileMode.write);

  File settingsViewModelFile = File('${settingsUiDirectory.path}/settings/settings_view_model.dart');
  await settingsViewModelFile.writeAsString(getSettingsViewModelText(appName), mode: FileMode.write);

  File settingsServiceFile = File('${settingsServicesDirectory.path}/settings_service.dart');
  await settingsServiceFile.writeAsString(getSettingsServiceText(appName), mode: FileMode.write);
}