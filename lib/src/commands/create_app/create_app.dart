import 'dart:io';

import 'package:args/args.dart';
import 'package:args/command_runner.dart';
import 'package:cli_util/cli_logging.dart';
import 'package:flutter_fast_cli/src/commands/create_app/steps/cleanup/clear_unused_paas_files.dart';
import 'package:flutter_fast_cli/src/commands/create_app/steps/cleanup/remove_injectable_environments.dart';
import 'package:flutter_fast_cli/src/commands/create_app/steps/cleanup/remove_subscription_feature.dart';
import 'package:flutter_fast_cli/src/commands/create_app/steps/cleanup/update_pubspec_file.dart';
import 'package:flutter_fast_cli/src/commands/create_app/steps/copy_template/load_template_folder.dart';
import 'package:flutter_fast_cli/src/commands/create_app/steps/native_updates/add_billing_dependency.dart';
import 'package:flutter_fast_cli/src/commands/create_app/steps/native_updates/fastlane_setup.dart';
import 'package:flutter_fast_cli/src/commands/create_app/steps/copy_template/copy_template.dart';
import 'package:flutter_fast_cli/src/commands/create_app/steps/root_updates/create_root_files.dart';
import 'package:flutter_fast_cli/src/commands/create_app/steps/native_updates/update_android_build_gradle.dart';
import 'package:flutter_fast_cli/src/commands/strings.dart';

class CreateApp extends Command {
  @override
  String get description => 'Create a new Flutter app with all the bells and whistles.';

  @override
  String get name => 'app';

  @override
  ArgParser get argParser {
    return ArgParser()
      ..addOption('name', abbr: 'n', help: 'The name of the app to create.')
      ..addOption(
        'org',
        abbr: 'o',
        help: 'The organization to use for the app.',
        valueHelp: 'com.example',
        defaultsTo: 'com.example',
      )
      ..addFlag(
        'subs',
        abbr: 's',
        help: 'Whether to include subscriptions in the app.',
        defaultsTo: true,
        negatable: true,
      )
      ..addFlag(
        'build',
        abbr: 'b',
        help: 'Whether to run the build_runner after the app has been created.',
        defaultsTo: true,
        negatable: true,
      )
      ..addOption(
        'paas',
        abbr: 'p',
        help: 'The PaaS to use for the app. If left blank, all files will be '
            'included and you can use --dart-define to choose which one to use.',
        valueHelp: 'firebase',
        allowed: ['firebase', 'supabase'],
      );
  }

  @override
  Future<void> run() async {
    final appName = argResults?['name'] as String?;
    final orgName = argResults!['org'] as String;
    final paas = argResults?['paas'] as String?;
    final subscriptions = argResults?['subs'] as bool;
    final build = argResults?['build'] as bool;

    var logger = Logger.standard();

    if (appName == null || appName.isEmpty) {
      print('Please provide a name for your app.');
      return;
    }

    var progress = logger.progress('Creating app $appName...');
    await Process.run('flutter', ['create', appName, '--empty', '--org', orgName]);
    progress.finish(showTiming: true);

    progress = logger.progress('Copying template...');
    String? path = await loadTemplateFolder();

    if (path == null) {
      logger.stdout('Template path is null');
      return;
    }

    templatePath = path;
    await copyTemplate(templatePath, appName);
    progress.finish(showTiming: true);

    progress = logger.progress('Creating root files...');
    await createRootFiles(templatePath, appName);
    progress.finish(showTiming: true);

    progress = logger.progress('Updating native files...');
    await updateAndroidBuildGradle(appName, orgName);
    await fastlaneSetup(templatePath, appName);
    if (!subscriptions) removeBillingDependency(templatePath, appName);
    progress.finish(showTiming: true);

    progress = logger.progress('Performing cleanup...');
    if (paas != null) {
      await clearUnusedPaasFiles(paas);
      await updatePubspecFile(appName, paas);
      await removeInjectableEnvironments();
    }

    if (!subscriptions) {
      await removeSubscriptionFeature();
    }
    progress.finish(showTiming: true);

    progress = logger.progress('Running flutter pub get...');
    await Process.run('flutter', ['pub', 'get']);
    progress.finish(showTiming: true);

    if (build) {
      progress = logger.progress('Running build_runner...');
      await Process.run('flutter', ['pub', 'run', 'build_runner', 'build', '--delete-conflicting-outputs']);
      progress.finish(showTiming: true);
    }

    progress = logger.progress('Tidying the workspace...');
    await Process.run('dart', ['format', '.']);
    progress.finish(showTiming: true);

    logger.stdout('Your app is ready! 🚀');
  }
}
