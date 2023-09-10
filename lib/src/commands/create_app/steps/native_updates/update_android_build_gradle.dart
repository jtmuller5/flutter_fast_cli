import 'dart:io';

import 'package:flutter_fast_cli/src/commands/strings.dart';

Future<void> updateAndroidBuildGradle(String appName, String orgName) async {
  File buildGradle = File('android/app/build.gradle');
  String buildGradleContents = getAndroidBuildGradleText().replaceAll('com.cotr.flutterfast', '$orgName.$appName');

  await buildGradle.writeAsString(buildGradleContents);
}
