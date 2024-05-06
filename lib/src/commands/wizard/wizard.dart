import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:cli_util/cli_logging.dart';
import 'package:flutter_fast_cli/src/commands/create_app/steps/cleanup/clear_unused_ab_test_files.dart';
import 'package:flutter_fast_cli/src/commands/create_app/steps/cleanup/clear_unused_analytics_files.dart';
import 'package:flutter_fast_cli/src/commands/create_app/steps/cleanup/clear_unused_paas_files.dart';
import 'package:flutter_fast_cli/src/commands/create_app/steps/cleanup/remove_feature_tags.dart';
import 'package:flutter_fast_cli/src/commands/create_app/steps/cleanup/remove_injectable_environments.dart';
import 'package:flutter_fast_cli/src/commands/create_app/steps/cleanup/remove_run_configurations.dart';
import 'package:flutter_fast_cli/src/commands/create_app/steps/cleanup/remove_subscription_feature.dart';
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

class Wizard extends Command {
  @override
  String get description => 'Use the Flutter Fast Wizard to create a new Flutter app with all the bells and whistles.';

  @override
  String get name => 'wizard';

  @override
  Future<void> run() async {
    logAmplitudeEvent('command', {'command': 'wizard'});
    // User input for app name
    String? appName;
    while (appName == null || appName.isEmpty || appName.contains(' ')) {
      // stdout.write('https://dart.dev/tools/pub/pubspec#name\n');
      stdout.write('Enter the name of your app (flutter_fast): ');
      appName = stdin.readLineSync();
    }

    // User input for organization name
    String? orgName;
    while (orgName == null || orgName.isEmpty || !RegExp(r'\w+\.\w+').hasMatch(orgName)) {
      stdout.write('Enter the organization name for your app (ex. com.example): ');
      orgName = stdin.readLineSync();
    }

    String? offlineOption;
    while (offlineOption != 'y' && offlineOption != 'n') {
      stdout.write('Do you want this app to be offline only? (y/N): ');
      offlineOption = stdin.readLineSync() ?? 'n';
      if (offlineOption.trim() == '') offlineOption = 'n';
    }
    final bool offline = offlineOption == 'y';

    String? paasOption;
    String? paas;
    String? analyticsOption;
    String? analytics;
    String? abTestsOption;
    String? abTests;
    if (!offline) {
      // User input for PaaS
      while (paasOption != 'f' && paasOption != 's' && paasOption != 'a' && paasOption != 'p') {
        stdout.write('Enter the PaaS you want to use for your app - (f)irebase, (s)upabase, (a)ppwrite, (p)ocketbase: ');
        paasOption = stdin.readLineSync() ?? 'f';
      }
      paas = paasOption == 'f'
          ? 'firebase'
          : paasOption == 's'
              ? 'supabase'
              : paasOption == 'p'
                  ? 'pocketbase'
                  : 'appwrite';

      while (analyticsOption != 'a' && analyticsOption != 'p') {
        stdout.write('Enter the analytics platform you want to use for your app - (a)mplitude, (p)osthog: ');
        analyticsOption = stdin.readLineSync() ?? 'f';
      }
      analytics = analyticsOption == 'a'
          ? 'amplitude'
          : analyticsOption == 'p'
              ? 'posthog'
              : 'amplitude';

      while (abTestsOption != 'y' && abTestsOption != 'n') {
        stdout.write('Do you want to include A/B tests in your app? (Y/n): ');
        abTestsOption = stdin.readLineSync() ?? 'y';
        if (abTestsOption.trim() == '') abTestsOption = 'y';
      }

      if (abTestsOption == 'y') {
        while (abTests != 'f' && abTests != 'p') {
          stdout.write('Enter the platform you want to use for AB tests - (f)irebase, (p)osthog: ');
          abTests = stdin.readLineSync() ?? '';
          if (abTests.trim() == '') abTestsOption = 'f';
        }

        abTests = abTests == 'f' ? 'firebase' : 'posthog';
      }
    }

    // User input for subscriptions
    String? subsOption;
    while (subsOption != 'y' && subsOption != 'n') {
      stdout.write('Do you want to include subscriptions in your app? (Y/n): ');
      subsOption = stdin.readLineSync() ?? 'y';
      if (subsOption.trim() == '') subsOption = 'y';
    }
    final bool subscriptions = subsOption == 'y';

    // Print out selections
    stdout.writeln('\n🛠️ Your selections:');
    stdout.writeln('App name: $appName');
    stdout.writeln('Organization name: $orgName');
    stdout.writeln('Offline: $offline');
    if (paas != null) stdout.writeln('PaaS: $paas');
    if (analytics != null) stdout.writeln('Analytics: $analytics');
    if (abTests != null) stdout.writeln('A/B Tests: $abTests');
    stdout.writeln('Subscriptions: $subscriptions');

    logAmplitudeEvent('wizard ready', {
      'appName': appName,
      'orgName': orgName,
      'offline': offline.toString(),
      'paas': paas ?? 'none',
      'abTests': abTests ?? 'none',
      'analytics': analytics ?? 'none',
      'subscriptions': subscriptions.toString(),
    });

    // Confirm selections
    String? confirmOption;
    while (confirmOption != 'y' && confirmOption != 'n') {
      stdout.write('Do you want to continue? (Y/n): ');
      confirmOption = stdin.readLineSync() ?? 'y';
      if (confirmOption.trim() == '') confirmOption = 'y';
    }

    if (confirmOption == 'n') {
      stdout.writeln('Exiting...');
      return;
    }

    // Create app
    var logger = Logger.standard();

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
      await updatePubspecFile(
        appName: appName,
        paas: paas,
        analytics: analytics,
      );
      await removeInjectableEnvironments();
    }

    if (analytics != null) {
      await clearUnusedAnalyticsFiles(analytics);
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

    logAmplitudeEvent('wizard complete', {
      'duration': progress.elapsed.toString(),
    });

    logger.stdout('Your app is ready! 🚀');
  }
}
