import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:cli_util/cli_logging.dart';
import 'package:flutter_fast_cli/src/commands/create_app/steps/cleanup/clear_unused_paas_files.dart';
import 'package:flutter_fast_cli/src/commands/create_app/steps/cleanup/remove_feature_tags.dart';
import 'package:flutter_fast_cli/src/commands/create_app/steps/cleanup/remove_injectable_environments.dart';
import 'package:flutter_fast_cli/src/commands/create_app/steps/cleanup/remove_logo_color_scheme.dart';
import 'package:flutter_fast_cli/src/commands/create_app/steps/cleanup/remove_run_configurations.dart';
import 'package:flutter_fast_cli/src/commands/create_app/steps/cleanup/remove_subscription_feature.dart';
import 'package:flutter_fast_cli/src/commands/create_app/steps/cleanup/update_pubspec_file.dart';
import 'package:flutter_fast_cli/src/commands/create_app/steps/copy_template/load_template_folder.dart';
import 'package:flutter_fast_cli/src/commands/create_app/steps/native_updates/remove_billing_dependency.dart';
import 'package:flutter_fast_cli/src/commands/create_app/steps/native_updates/create_key_file.dart';
import 'package:flutter_fast_cli/src/commands/create_app/steps/native_updates/fastlane_setup.dart';
import 'package:flutter_fast_cli/src/commands/create_app/steps/copy_template/copy_template.dart';
import 'package:flutter_fast_cli/src/commands/create_app/steps/native_updates/remove_shorebird_lanes.dart';
import 'package:flutter_fast_cli/src/commands/create_app/steps/root_updates/create_root_files.dart';
import 'package:flutter_fast_cli/src/commands/create_app/steps/native_updates/update_android_build_gradle.dart';
import 'package:flutter_fast_cli/src/commands/strings.dart';
import 'package:flutter_fast_cli/src/commands/utils/utils.dart';

class Wizard extends Command {
  @override
  String get description => 'Use the Flutter Fast Wizard to create a new Flutter app with all the bells and whistles.';

  @override
  String get name => 'wizard';

  @override
  Future<void> run() async {
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
    if (!offline) {
      // User input for PaaS
      while (paasOption != 'f' && paasOption != 's' && paasOption != 'a' && paasOption != 'p') {
        stdout.write('Enter the PaaS you want to use for your app (f)irebase, (s)upabase, (a)ppwrite: ');
        paasOption = stdin.readLineSync() ?? 'f';
      }
      paas = paasOption == 'f'
          ? 'firebase'
          : paasOption == 's'
              ? 'supabase'
              : paasOption == 'p'
                  ? 'pocketbase'
                  : 'appwrite';
    }

    // User input for subscriptions
    String? subsOption;
    while (subsOption != 'y' && subsOption != 'n') {
      stdout.write('Do you want to include subscriptions in your app? (Y/n): ');
      subsOption = stdin.readLineSync() ?? 'y';
      if (subsOption.trim() == '') subsOption = 'y';
    }
    final bool subscriptions = subsOption == 'y';

    // User input for build
    String? buildOption;
    while (buildOption != 'y' && buildOption != 'n') {
      stdout.write('Do you want to run the build_runner after the app has been created? (Y/n): ');
      buildOption = stdin.readLineSync() ?? 'y';
      if (buildOption.trim() == '') buildOption = 'y';
    }
    final bool build = buildOption == 'y';

    // User input for shorebird
    String? shorebirdOption;
    while (shorebirdOption != 'y' && shorebirdOption != 'n') {
      stdout.write('Do you want to include Shorebird lanes in Fastfiles? (Y/n): ');
      shorebirdOption = stdin.readLineSync() ?? 'y';
      if (shorebirdOption.trim() == '') shorebirdOption = 'y';
    }
    final bool shorebird = shorebirdOption == 'y';

    // User input for logo color scheme
    String? logoOption;
    while (logoOption != 'y' && logoOption != 'n') {
      stdout.write('Do you want to generate a ColorScheme from your logo? (Y/n): ');
      logoOption = stdin.readLineSync() ?? 'y';
      if (logoOption.trim() == '') logoOption = 'y';
    }
    final bool logoColorScheme = logoOption == 'y';

    // Print out selections
    stdout.writeln('\n🛠️ Your selections:');
    stdout.writeln('App name: $appName');
    stdout.writeln('Organization name: $orgName');
    stdout.writeln('Offline: $offline');
    if (paas != null) stdout.writeln('PaaS: $paas');
    stdout.writeln('Subscriptions: $subscriptions');
    stdout.writeln('Build: $build');
    stdout.writeln('Shorebird: $shorebird');
    stdout.writeln('Logo color scheme: $logoColorScheme');

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
    await fastlaneSetup(templatePath, appName);
    await createKeyFile();
    if (!shorebird) await removeShorebirdLanes();
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

    if (!logoColorScheme) {
      await removeLogoColorScheme();
    }

    await removeRunConfigurations();

    await removeFeatureTags();

    progress.finish(showTiming: true);

    progress = logger.progress('Running flutter pub get...');
    await Process.run(flutterPath, ['pub', 'get']);
    progress.finish(showTiming: true);

    if (build) {
      progress = logger.progress('Running build_runner...');
      await Process.run(flutterPath, ['pub', 'run', 'build_runner', 'build', '--delete-conflicting-outputs']);
      progress.finish(showTiming: true);
    }

    progress = logger.progress('Tidying the workspace...');
    await Process.run('dart', ['format', '.']);
    progress.finish(showTiming: true);

    logger.stdout('Your app is ready! 🚀');
  }
}
