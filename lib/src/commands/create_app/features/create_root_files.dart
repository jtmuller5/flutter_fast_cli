import 'dart:io';

import 'package:flutter_fast_cli/src/strings/config.dart';

import '../../../strings/strings.dart';

Future<void> createRootFiles() async {
  File analysisOptions = File('analysis_options.yaml');
  await analysisOptions.writeAsString(analysisOptionsText, mode: FileMode.write);

  File pubspec = File('pubspec.yaml');
  await pubspec.writeAsString(pubspecText, mode: FileMode.write);

  Directory assetsDirectory = await Directory('assets').create();
  File config = File('${assetsDirectory.path}/config.json');
  await config.writeAsString(getConfigText(), mode: FileMode.write);
}