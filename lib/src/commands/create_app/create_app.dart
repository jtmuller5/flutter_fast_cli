import 'dart:io';

import 'package:args/args.dart';
import 'package:args/command_runner.dart';
import 'package:flutter_fast_cli/src/bundles/fast_app_offline_bundle.dart';
import 'package:flutter_fast_cli/src/bundles/fast_app_online_auth_bundle.dart';
import 'package:flutter_fast_cli/src/commands/utils/analytics.dart';
import 'package:flutter_fast_cli/src/commands/utils/cli_inputs.dart';
import 'package:mason/mason.dart';

class CreateApp extends Command {
  @override
  String get description => 'Create a new Flutter app with ALL the bells and whistles.';

  @override
  String get name => 'app';

  @override
  ArgParser get argParser {
    return ArgParser()
      ..addOption(
        'name',
        abbr: 'n',
        help: 'The name of the app to create.',
        valueHelp: 'my_app',
      )
      ..addOption(
        'org',
        abbr: 'o',
        help: 'The organization or company name for the app.',
        valueHelp: 'com.my_org',
      )
      ..addFlag(
        'offline',
        abbr: 'x',
        help: 'Create the app without any online features.',
        negatable: false,
      )
      ..addFlag(
        'fresh',
        abbr: 'f',
        help: 'Create the app without the Flutter Fast Firebase setup.',
      );
  }

  @override
  Future<void> run() async {
    // Read arguments
    String? name = argResults?['name'] as String?;
    String? org = argResults?['org'] as String?;
    bool offline = argResults?['offline'] as bool? ?? false;
    bool fresh = argResults?['fresh'] as bool? ?? false;

    while (name == null || name.isEmpty) {
      stdout.write('Enter the name of your app: ');
      name = stdin.readLineSync();
    }

    while (org == null || org.isEmpty) {
      stdout.write('Enter the organization or company name for your app: ');
      org = stdin.readLineSync();
    }

    Map<String, dynamic> vars = {
      'name': name,
      'org': org,
      'offline': offline,
      'fresh': fresh,
    };

    logAmplitudeEvent('command', {'command': 'app'});
    logAmplitudeEvent('app ready', vars);

    var logger = Logger();
    vars.forEach((key, value) {
      logger.info('$key: $value');
    });
    
    MasonBundle bundle = offline ? fastAppOfflineBundle : fastAppOnlineAuthBundle;
    final generator = await MasonGenerator.fromBundle(bundle);

    // Ask for confirmation
    if (!getYesNo('Do you want to create a new Flutter app with these settings?')) {
      return;
    }

    logger.info('Creating app...');
    await generator.hooks.preGen(
      vars: vars,
      onVarsChanged: (newVars) {
        vars = newVars;
      },
    );
    await generator.generate(
      DirectoryGeneratorTarget(Directory.current),
      vars: vars,
    );
    await generator.hooks.postGen(vars: vars);

    if (fresh) {
// Delete specific files in the generated directory
      final filesToDelete = [
        '$name/lib/firebase_options.dart',
        '$name/firebase.json',
        '$name/.firebaserc',
      ];

      for (var filePath in filesToDelete) {
        final file = File(filePath);
        if (await file.exists()) {
          await file.delete();
        }
      }
    }

    logAmplitudeEvent('app complete', vars);
    logger.success('Your app is ready! 🚀');
  }
}
