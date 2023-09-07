import 'dart:io';

import 'package:args/args.dart';
import 'package:args/command_runner.dart';
import 'package:cli_util/cli_logging.dart';
import 'package:flutter_fast_cli/src/commands/create_app/features/copy_template.dart';
import 'package:flutter_fast_cli/src/commands/create_app/features/create_root_files.dart';
import 'package:flutter_fast_cli/src/commands/create_app/features/update_android_build_gradle.dart';

class CreateApp extends Command {
  @override
  String get description => 'Create a new Flutter app with all the bells and whistles.';

  @override
  String get name => 'app';

  @override
  ArgParser get argParser {
    return ArgParser()
      ..addOption('name', abbr: 'n', help: 'The name of the app to create.')
      ..addOption('org', abbr: 'o', help: 'The organization to use for the app.', valueHelp: 'com.example', defaultsTo: 'com.example')
      ..addOption('paas', abbr: 'p', help: 'The PaaS to use for the app.', valueHelp: 'firebase', defaultsTo: 'firebase', allowed: ['firebase', 'supabase']);
  }

  @override
  Future<void> run() async {
    final appName = argResults!['name'] as String;
    final orgName = argResults!['org'] as String;
    final paas = argResults!['paas'] as String;

    var logger = Logger.standard();

    if (appName.isEmpty) {
      print('Please provide a name for your app.');
      return;
    }

    var progress = logger.progress('Creating app $appName...');
    await Process.run('flutter', ['create', appName, '--empty', '--org', orgName]);
    progress.finish(showTiming: true);

    progress = logger.progress('Copying template...');
    await copyTemplate(appName);
    progress.finish(showTiming: true);

    progress = logger.progress('Creating root files...');
    await createRootFiles(appName);
    progress.finish(showTiming: true);

    progress = logger.progress('Updating native files...');
    await updateAndroidBuildGradle(appName, orgName);
    progress.finish(showTiming: true);

    progress = logger.progress('Running flutter pub get...');
    await Process.run('flutter', ['pub', 'get']);
    progress.finish(showTiming: true);

    progress = logger.progress('Running build_runner...');
    await Process.run('flutter', ['pub', 'run', 'build_runner', 'build', '--delete-conflicting-outputs']);
    progress.finish(showTiming: true);

    logger.stdout('Your app is ready! 🚀');
  }
}
