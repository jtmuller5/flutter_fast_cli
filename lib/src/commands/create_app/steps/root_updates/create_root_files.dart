import 'dart:io';

import 'package:flutter_fast_cli/src/commands/strings.dart';
import 'package:io/io.dart';

Future<void> createRootFiles(String templatePath, String appName) async {
  File analysisOptions = File('analysis_options.yaml');
  await analysisOptions.writeAsString(getAnalysisOptionsText(), mode: FileMode.write);

  File pubspecLock = File('pubspec.lock');
  if (pubspecLock.existsSync()) await pubspecLock.delete();

  File pubspec = File('pubspec.yaml');
  await pubspec.writeAsString(getPubspecText(appName), mode: FileMode.write);

  File build = File('build.yaml');
  await build.writeAsString(getBuildYamlText(), mode: FileMode.write);

  File readme = File('README.md');
  await readme.writeAsString(getReadmeText(appName), mode: FileMode.write);

  await copyPath('$templatePath/assets/images', 'assets/images');

  Directory runDirectory = Directory('$templatePath/runConfigurations');

  if (runDirectory.existsSync()) {
    await copyPath('$templatePath/runConfigurations', '.idea/runConfigurations');

    await copyPath('$templatePath/.vscode', '.idea/.vscode');
  }

  File config = File('assets/config.json');
  await config.writeAsString('''
  {
  "AMPLITUDE_API_KEY": "",
  "APPWRITE_PROJECT_ID": "",
  "APPWRITE_MAGIC_LINK_URL": "",
  "APPWRITE_DATABASE_ID": "",
  "APPWRITE_USERS_COLLECTION_ID": "",
  "APPWRITE_FEEDBACK_COLLECTION_ID": "",
  "GOOGLE_SDK_KEY": "",
  "IOS_SDK_KEY": "",
  "AMAZON_SDK_KEY": "",
  "SENTRY_DSN": "",
  "SUPABASE_URL": "",
  "SUPABASE_ANON_KEY": ""
}
  ''', mode: FileMode.write);

  await copyPath('$templatePath/scripts', 'scripts');
}
