import 'dart:io';

import 'package:flutter_fast_cli/src/strings/router.dart';

Future<void> createNavigation(String appName) async {
  Directory appDirectory = Directory('app');
  Directory navigationDirectory = await Directory('features/navigation').create();

  File routerFile = File('${appDirectory.path}/router.dart');
  await routerFile.writeAsString(getRouterText(appName), mode: FileMode.write);
}