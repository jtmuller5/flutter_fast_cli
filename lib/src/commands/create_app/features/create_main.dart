import 'dart:io';

import 'package:flutter_fast_cli/src/commands/strings.dart';

Future<void> createMain(String appName) async {
  File mainFile = File('main.dart');
  await mainFile.writeAsString(getMainText(appName), mode: FileMode.write);
}