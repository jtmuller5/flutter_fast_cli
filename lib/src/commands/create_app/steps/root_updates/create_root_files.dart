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
  Directory vsCodeDirectory = Directory('$templatePath/.vscode');

  if (runDirectory.existsSync()) {
    await copyPath('$templatePath/runConfigurations', '.idea/runConfigurations');
  }

  if (vsCodeDirectory.existsSync()) {
    await copyPath('$templatePath/.vscode', '.vscode');

    File entity = File('.vscode/launch.json');
    var content = await entity.readAsString();
    var modifiedContent = content.replaceAll('internal-', '');
    await entity.writeAsString(modifiedContent);
  }

  File config = File('assets/config.json');
  await config.writeAsString('''
  {
  "AMAZON_SDK_KEY": "",
  "AMPLITUDE_API_KEY": "6b620def2f03cac6cee826b17992790d",
  "APPWRITE_PROJECT_ID": "",
  "APPWRITE_MAGIC_LINK_URL": "",
  "APPWRITE_DATABASE_ID": "",
  "APPWRITE_USERS_COLLECTION_ID": "",
  "APPWRITE_FEEDBACK_COLLECTION_ID": "",
  "GOOGLE_SDK_KEY": "",
  "IOS_SDK_KEY": "",
  "POCKETBASE_URL": "http://127.0.0.1:8090",
  "SENTRY_DSN": "",
  "SUPABASE_URL": "https://xgiwtcbryqkepaaftabz.supabase.co",
  "SUPABASE_ANON_KEY": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InhnaXd0Y2JyeXFrZXBhYWZ0YWJ6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTQwMzcyODEsImV4cCI6MjAwOTYxMzI4MX0.LtQWdV1wAbJofUOFFe_xI42cClmEzxQSlZ8wtYuJdMQ"
}
  ''', mode: FileMode.write);

  await copyPath('$templatePath/scripts', 'scripts');
}
