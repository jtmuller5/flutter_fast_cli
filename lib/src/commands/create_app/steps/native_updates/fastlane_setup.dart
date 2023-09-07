import 'dart:io';

import 'package:io/io.dart';

Future<void> fastlaneSetup(String templatePath, String appName) async {

  Directory androidFastlane = Directory('android/fastlane');
  Directory iosFastlane = Directory('ios/fastlane');

  await copyPath('$templatePath/android/fastlane', androidFastlane.path);
  await copyPath('$templatePath/ios/fastlane', iosFastlane.path);

  File iosFastfile = File('ios/fastlane/Fastfile');

  await Process.run(
    'find',
    [iosFastfile.path, '-type', 'f', '-exec', 'sed', '-i', '', 's/templateApp/$appName/', '{}', ';'],
    workingDirectory: Directory.current.path,
  );
}