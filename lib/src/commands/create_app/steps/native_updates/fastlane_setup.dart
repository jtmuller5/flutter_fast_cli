import 'dart:io';

import 'package:io/io.dart';

Future<void> fastlaneSetup(String templatePath, String appName) async {
  Directory androidFastlane = Directory('android/fastlane');
  Directory iosFastlane = Directory('ios/fastlane');

  await copyPath('$templatePath/android/fastlane', androidFastlane.path);
  await copyPath('$templatePath/ios/fastlane', iosFastlane.path);

  File env = File('ios/fastlane/.env.default');
  await env.writeAsString('''
FASTLANE_USER=
FASTLANE_PASSWORD=
FASTLANE_APPLE_APPLICATION_SPECIFIC_PASSWORD=
  ''', mode: FileMode.write);

  File iosFastfile = File('ios/fastlane/Fastfile');

  await Process.run(
    'find',
    [
      iosFastfile.path,
      '-type',
      'f',
      '-exec',
      'sed',
      '-i',
      '',
      's/flutterfastApp/$appName/',
      '{}',
      ';'
    ],
    workingDirectory: Directory.current.path,
  );
}
