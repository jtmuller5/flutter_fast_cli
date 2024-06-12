import 'dart:io';

import 'package:args/args.dart';
import 'package:args/command_runner.dart';
import 'package:flutter_fast_cli/src/bundles/fast_app_bundle.dart';
import 'package:flutter_fast_cli/src/commands/utils/analytics.dart';
import 'package:flutter_fast_cli/src/commands/utils/cli_inputs.dart';
import 'package:mason/mason.dart';

class CreateApp extends Command {
  @override
  String get description => 'Create a new Flutter app with all the bells and whistles.';

  @override
  String get name => 'app';

  @override
  ArgParser get argParser {
    return ArgParser()
      ..addOption(
        'auth',
        abbr: 'a',
        help: 'The authentication providerto use for the app.',
        valueHelp: 'firebase',
        allowed: [
          'firebase',
          'supabase',
          'appwrite',
          'pocketbase',
        ],
      )
      ..addOption(
        'router',
        abbr: 'r',
        help: 'The router to use.',
        valueHelp: 'vanilla',
        defaultsTo: 'vanilla',
        allowed: ['auto_route', 'go_router', 'vanilla'],
      )
      ..addOption(
        'ab_test',
        abbr: 'b',
        help: 'The platform to use for AB tests.',
        valueHelp: 'firebase_analytics',
        allowed: ['firebase_remote_config', 'posthog_ab_tests'],
      )
      ..addOption(
        'analytics',
        abbr: 't',
        help: 'The analytics platform to use for the app. If left blank, all files will be '
            'included and you can use --dart-define to choose which one to use.',
        valueHelp: 'amplitude',
        allowed: ['firebase_analytics', 'amplitude', 'posthog'],
      )
      ..addOption(
        'crash',
        abbr: 'c',
        help: 'The crash reporting platform to use for the app.',
        valueHelp: 'sentry',
        allowed: ['sentry', 'firebase_crashlytics'],
      )
      ..addFlag(
        'injectable',
        abbr: 'i',
        help: 'Set to true to use injectable for dependency injection.',
        defaultsTo: false,
        negatable: true,
      );
  }

  @override
  Future<void> run() async {
    String? authOption;
    String? analyticsOption;
    String? abTestsOption;
    String? crashOption;
    String? routerOption;

    String? name;
    String? auth = argResults?['auth'] as String?;
    String? crash = argResults?['crash'] as String?;
    String? router = argResults?['router'] as String?;
    bool? injectable = argResults?['injectable'] as bool?;
    String? analytics = argResults?['analytics'] as String?;
    String? abTests = argResults?['ab_test'] as String?;

    // User input for PaaS
    while (authOption != 'f' && authOption != 's' && authOption != 'a' && authOption != 'p') {
      stdout.write('Enter the Authentication provider you want to use for your app - (f)irebase, (s)upabase, (a)ppwrite, (p)ocketbase: ');
      authOption = stdin.readLineSync() ?? 'f';
    }
    auth = authOption == 'f'
        ? 'firebase'
        : authOption == 's'
            ? 'supabase'
            : authOption == 'p'
                ? 'pocketbase'
                : 'appwrite';

    while (analyticsOption != 'a' && analyticsOption != 'p' && analyticsOption != 'f') {
      stdout.write('Enter the analytics platform you want to use for your app - (a)mplitude, (p)osthog, (f)irebase: ');
      analyticsOption = stdin.readLineSync() ?? 'f';
    }
    analytics = analyticsOption == 'a'
        ? 'amplitude'
        : analyticsOption == 'p'
            ? 'posthog'
            : analyticsOption == 'f'
                ? 'firebase_analytics'
                : 'amplitude';

    while (abTestsOption != 'f' && abTestsOption != 'p') {
      stdout.write('Enter the platform you want to use for AB tests - (f)irebase_remote_config, (p)osthog_ab_tests: ');
      abTestsOption = stdin.readLineSync() ?? '';
      if (abTestsOption.trim() == '') abTestsOption = 'f';
    }

    abTests = abTestsOption == 'f' ? 'firebase_remote_config' : 'posthog_ab_tests';

    while (crashOption != 's' && crashOption != 'f') {
      stdout.write('Enter the crash reporting platform you want to use for your app - (s)entry, (f)irebase_crashlytics: ');
      crashOption = stdin.readLineSync() ?? 's';
    }

    crash = crashOption == 's' ? 'sentry' : 'firebase_crashlytics';

    while (routerOption != 'a' && routerOption != 'g' && routerOption != 'v') {
      stdout.write('Enter the router you want to use for your app - (a)uto_route, (g)o_router, (v)anilla: ');
      routerOption = stdin.readLineSync() ?? 'v';
    }

    router = routerOption == 'a'
        ? 'auto_route'
        : routerOption == 'g'
            ? 'go_router'
            : 'vanilla';

    injectable = getYesNo('Do you want to use injectable for dependency injection?');

    Map<String, dynamic> vars = {
      'auth': auth,
      'crash': crash,
      'router': router,
      'injectable': injectable,
      'analytics': analytics,
      'ab_test': abTests,
    };

    logAmplitudeEvent('command', {'command': 'app'});
    logAmplitudeEvent('app ready', vars);

    var logger = Logger();
    logger.info(vars.toString());

    MasonBundle bundle = fastAppBundle;
    final generator = await MasonGenerator.fromBundle(bundle);

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

    logAmplitudeEvent('app complete', vars);
    logger.success('Your app is ready! 🚀');
  }
}
