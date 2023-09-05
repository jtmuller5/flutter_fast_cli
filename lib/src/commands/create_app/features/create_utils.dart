import 'dart:io';

import '../../../strings/strings.dart';

Future<void> createUtils() async {
  var appDirectory = await Directory('app').create();

  File constantsFile = File('${appDirectory.path}/constants.dart');
  await constantsFile.writeAsString(constantsText, mode: FileMode.write);

  File getItFile = File('${appDirectory.path}/get_it.dart');
  await getItFile.writeAsString(getItText, mode: FileMode.write);
}