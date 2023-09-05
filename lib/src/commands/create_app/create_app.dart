import 'dart:io';

import 'package:args/args.dart';
import 'package:args/command_runner.dart';
import 'package:flutter_fast_cli/src/commands/create_app/features/create_authentication.dart';
import 'package:flutter_fast_cli/src/commands/create_app/features/create_navigation.dart';
import 'package:flutter_fast_cli/src/commands/create_app/features/create_root_files.dart';
import 'package:flutter_fast_cli/src/commands/create_app/features/create_settings.dart';
import 'package:flutter_fast_cli/src/commands/create_app/features/create_subscriptions.dart';
import 'package:flutter_fast_cli/src/commands/create_app/features/create_utils.dart';

class CreateApp extends Command {
  @override
  String get description => 'Create a new Flutter app with all the bells and whistles.';

  @override
  String get name => 'app';

  @override
  ArgParser get argParser {
    return ArgParser();
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

    await Process.run('flutter', ['create', 'my_app','--empty', '--org', 'com.cotr']);

    Directory.current = Directory('my_app');
    await createRootFiles();

    Directory.current = Directory('lib');
    var appDirectory = await Directory('app').create();
    var featuresDirectory = await Directory('features').create();

    await createUtils();
    await createNavigation();
    await createSettings();
    await createAuthentication();
    await createSubscriptions();

    // await Process.run('flutter', ['pub', 'get']);
    // await Process.run('flutter', ['pub', 'run', 'build_runner', 'build', '--delete-conflicting-outputs']);
  }
}
