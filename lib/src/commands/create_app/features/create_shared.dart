import 'dart:io';

import 'package:flutter_fast_cli/src/commands/create_app/features/utils.dart';
import 'package:flutter_fast_cli/src/commands/strings.dart';

Future<void> createShared(String appName) async {
  Directory servicesDirectory;
  Directory uiDirectory;
  Directory modelsDirectory;

  (modelsDirectory, servicesDirectory, uiDirectory) = await createFeature('shared');

  var navDirectory = await Directory('features/shared/utils/navigation').create(recursive: true);
  var jsonDirectory = await Directory('features/shared/utils/json').create(recursive: true);

  File appLogoFile = File('${uiDirectory.path}/app_logo.dart');
  await appLogoFile.writeAsString(getAppLogoText(), mode: FileMode.write);

  File modulesFile = File('${servicesDirectory.path}/modules.dart');
  await modulesFile.writeAsString(getModulesText(), mode: FileMode.write);

  File timeServiceFile = File('${servicesDirectory.path}/time_service.dart');
  await timeServiceFile.writeAsString(getTimeServiceText(), mode: FileMode.write);

  File authGuardFile = File('${navDirectory.path}/auth_guard.dart');
  await authGuardFile.writeAsString(getAuthGuardText(appName), mode: FileMode.write);

  File basicObserverFile = File('${navDirectory.path}/basic_observer.dart');
  await basicObserverFile.writeAsString(getBasicObserverText(appName), mode: FileMode.write);

  File jsonUtilsFile = File('${jsonDirectory.path}/utils.dart');
  await jsonUtilsFile.writeAsString(getUtilsText(), mode: FileMode.write);
}
