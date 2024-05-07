import 'dart:io';

import 'package:args/args.dart';
import 'package:args/command_runner.dart';
import 'package:cli_util/cli_logging.dart';
import 'package:flutter_fast_cli/src/commands/create_app/steps/cleanup/clear_unused_ab_test_files.dart';
import 'package:flutter_fast_cli/src/commands/create_app/steps/cleanup/clear_unused_analytics_files.dart';
import 'package:flutter_fast_cli/src/commands/create_app/steps/cleanup/clear_unused_paas_files.dart';
import 'package:flutter_fast_cli/src/commands/create_app/steps/cleanup/remove_feature_tags.dart';
import 'package:flutter_fast_cli/src/commands/create_app/steps/cleanup/remove_injectable_environments.dart';
import 'package:flutter_fast_cli/src/commands/create_app/steps/cleanup/remove_run_configurations.dart';
import 'package:flutter_fast_cli/src/commands/create_app/steps/cleanup/remove_subscription_feature.dart';
import 'package:flutter_fast_cli/src/commands/create_app/steps/cleanup/update_analytics_environment.dart';
import 'package:flutter_fast_cli/src/commands/create_app/steps/cleanup/update_pubspec_file.dart';
import 'package:flutter_fast_cli/src/commands/create_app/steps/copy_template/load_template_folder.dart';
import 'package:flutter_fast_cli/src/commands/create_app/steps/native_updates/copy_android_manifest.dart';
import 'package:flutter_fast_cli/src/commands/create_app/steps/native_updates/copy_ios_files.dart';
import 'package:flutter_fast_cli/src/commands/create_app/steps/native_updates/remove_billing_dependency.dart';
import 'package:flutter_fast_cli/src/commands/create_app/steps/native_updates/create_key_file.dart';
import 'package:flutter_fast_cli/src/commands/create_app/steps/native_updates/fastlane_setup.dart';
import 'package:flutter_fast_cli/src/commands/create_app/steps/copy_template/copy_template.dart';
import 'package:flutter_fast_cli/src/commands/create_app/steps/root_updates/create_root_files.dart';
import 'package:flutter_fast_cli/src/commands/create_app/steps/native_updates/update_android_build_gradle.dart';
import 'package:flutter_fast_cli/src/commands/strings.dart';
import 'package:flutter_fast_cli/src/commands/utils/analytics.dart';
import 'package:flutter_fast_cli/src/commands/utils/utils.dart';

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
        'offline',
        abbr: 'f',
        help: 'Whether the app should be specifically for offline use.',
        defaultsTo: false,
      )
      ..addFlag(
        'subs',
        abbr: 's',
        help: 'Whether to include subscriptions in the app.',
        defaultsTo: true,
        negatable: true,
      )
      ..addOption(
        'paas',
        abbr: 'p',
        help: 'The PaaS to use for the app. If left blank, all files will be '
            'included and you can use --dart-define to choose which one to use.',
        valueHelp: 'firebase',
        allowed: ['firebase', 'supabase', 'appwrite', 'pocketbase'],
      )
      ..addOption(
        'abtests',
        abbr: 'b',
        help: 'The platform to use for AB tests. If left blank, all files will be '
            'included and you can use --dart-define to choose which one to use.',
        valueHelp: 'firebase',
        allowed: ['firebase', 'posthog'],
      )
      ..addOption(
        'analytics',
        abbr: 'a',
        help: 'The analytics platform to use for the app. If left blank, all files will be '
            'included and you can use --dart-define to choose which one to use.',
        valueHelp: 'amplitude',
        allowed: ['amplitude', 'posthog'],
      );
  }

  @override
  Future<void> run() async {
    final appName = argResults?['name'] as String?;
    final orgName = argResults?['org'] as String?;
    final offline = argResults?['offline'] as bool;
    final paas = argResults?['paas'] as String?;
    final analytics = argResults?['analytics'] as String?;
    final abTests = argResults?['abtests'] as String?;
    final subscriptions = argResults?['subs'] as bool;

    logAmplitudeEvent('command', {'command': 'app'});
    logAmplitudeEvent('app ready', {
      'appName': appName ?? 'none',
      'orgName': orgName ?? 'none',
      'offline': offline.toString(),
      'paas': paas ?? 'none',
      'abtests': abTests ?? 'none',
      'analytics': analytics ?? 'none',
      'subscriptions': subscriptions.toString(),
    });

    var logger = Logger.standard();

    if (appName == null || appName.isEmpty) {
      print('Please provide a name for your app.');
      return;
    }

    if (orgName == null || orgName.isEmpty) {
      print('Please provide an organization name for your app (ex. com.example).');
      return;
    }

    var progress = logger.progress('Creating app $appName...');
    await Process.run(flutterPath, ['create', appName, '--empty', '--org', orgName]);
    progress.finish(showTiming: true);

    progress = logger.progress('Copying template...');
    String? path = await loadTemplateFolder(offline);

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
    await copyAndroidManifest(templatePath, appName, orgName);
    await copyIosFiles(templatePath);
    await fastlaneSetup(templatePath, appName);
    await createKeyFile();
    if (!subscriptions) removeBillingDependency(templatePath, appName);
    progress.finish(showTiming: true);

    progress = logger.progress('Performing cleanup...');
    if (paas != null) {
      await clearUnusedPaasFiles(paas);
      await removeInjectableEnvironments();
    }

    if (analytics != null) {
      await clearUnusedAnalyticsFiles(analytics);
      await updateAnalyticsEnvironment(analytics);
    }

    if (!subscriptions) {
      await removeSubscriptionFeature();
    }

    if (abTests == null) {
      await clearUnusedAbTestFiles('firebase');
      await clearUnusedAbTestFiles('posthog');
    } else {
      if (abTests == 'firebase') {
        await clearUnusedAbTestFiles('firebase');
      } else {
        await clearUnusedAbTestFiles('posthog');
      }
    }

    await updatePubspecFile(
      appName: appName,
      paas: paas,
      analytics: analytics,
    );

    await removeRunConfigurations();

    await removeFeatureTags();

    progress.finish(showTiming: true);

    progress = logger.progress('Running flutter pub get...');
    await Process.run(flutterPath, ['pub', 'get']);
    progress.finish(showTiming: true);

    progress = logger.progress('Running build_runner...');
    await Process.run(flutterPath, ['pub', 'run', 'build_runner', 'build', '--delete-conflicting-outputs']);
    progress.finish(showTiming: true);

    progress = logger.progress('Tidying the workspace...');
    await Process.run('dart', ['format', '.']);
    progress.finish(showTiming: true);

    logAmplitudeEvent('app complete', {
      'duration': progress.elapsed.toString(),
    });

    logger.stdout('Your app is ready! 🚀');
  }
}
