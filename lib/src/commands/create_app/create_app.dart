import 'dart:io';

import 'package:args/args.dart';
import 'package:args/command_runner.dart';
import 'package:flutter_fast_cli/src/commands/create_app/features/copy_template.dart';
import 'package:flutter_fast_cli/src/commands/create_app/features/create_authentication.dart';
import 'package:flutter_fast_cli/src/commands/create_app/features/create_home.dart';
import 'package:flutter_fast_cli/src/commands/create_app/features/create_main.dart';
import 'package:flutter_fast_cli/src/commands/create_app/features/create_monitoring.dart';
import 'package:flutter_fast_cli/src/commands/create_app/features/create_root_files.dart';
import 'package:flutter_fast_cli/src/commands/create_app/features/create_settings.dart';
import 'package:flutter_fast_cli/src/commands/create_app/features/create_shared.dart';
import 'package:flutter_fast_cli/src/commands/create_app/features/create_subscriptions.dart';
import 'package:flutter_fast_cli/src/commands/create_app/features/create_utils.dart';

class CreateApp extends Command {
  @override
  String get description => 'Create a new Flutter app with all the bells and whistles.';

  @override
  String get name => 'app';

  @override
  ArgParser get argParser {
    return ArgParser()
      ..addOption('name', abbr: 'n', help: 'The name of the app to create.')
      ..addOption('org', abbr: 'o', help: 'The organization to use for the app.', valueHelp: 'com.example', defaultsTo: 'com.example');
    /*..addFlag(
        'get_it',
        abbr: 'g',
        defaultsTo: true,
        negatable: true,
        help: 'Set up get_it for dependency injection.',
      )
      ..addOption(
        'nav',
        abbr: 'n',
        defaultsTo: 'auto_route',
        help: 'Select the package to use for navigation',
        allowed: ['auto_route', 'go_router', 'none'],
      );*/
  }

  @override
  Future<void> run() async {
    final appName = argResults!['name'] as String;
    final orgName = argResults!['org'] as String;

    if (appName.isEmpty) {
      print('Please provide a name for your app.');
      return;
    }

    await Process.run('flutter', ['create', appName, '--empty', '--org', orgName]);

    await copyTemplate(appName);

    /*Directory.current = Directory(appName);
    await createRootFiles(appName);

    Directory.current = Directory('lib');
    var appDirectory = await Directory('app').create();
    var featuresDirectory = await Directory('features').create();

    await createUtils(appName);
    await createAuthentication(appName);
    await createHome(appName);
    await createMonitoring(appName);
    await createSettings(appName);
    await createShared(appName);
    await createSubscriptions(appName);
    await createMain(appName);*/

    await Process.run('flutter', ['pub', 'get']);
    await Process.run('flutter', ['pub', 'run', 'build_runner', 'build', '--delete-conflicting-outputs']);
  }
}
