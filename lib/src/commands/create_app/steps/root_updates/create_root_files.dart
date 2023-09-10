import 'dart:io';

import 'package:flutter_fast_cli/src/commands/strings.dart';
import 'package:io/io.dart';

Future<void> createRootFiles(String templatePath, String appName) async {
  File analysisOptions = File('analysis_options.yaml');
  await analysisOptions.writeAsString(getAnalysisOptionsText(),
      mode: FileMode.write);

  File pubspecLock = File('pubspec.lock');
  if (pubspecLock.existsSync()) await pubspecLock.delete();

  File pubspec = File('pubspec.yaml');
  await pubspec.writeAsString(getPubspecText(appName), mode: FileMode.write);

  File build = File('build.yaml');
  await build.writeAsString(getBuildYamlText(), mode: FileMode.write);

  File readme = File('README.md');
  await readme.writeAsString(getReadmeText(appName), mode: FileMode.write);

  await copyPath('$templatePath/assets', 'assets');
}
