import 'dart:io';

import 'package:args/args.dart';
import 'package:args/command_runner.dart';
import 'package:flutter_fast_cli/src/commands/utils/utils.dart';

class Clean extends Command {
  @override
  String get description => 'Perform a deep clean on your Flutter project.';

  @override
  String get name => 'clean';

  @override
  ArgParser get argParser {
    return ArgParser()
      ..addFlag(
        'ios',
        abbr: 'i',
        help: 'Whether to remove and reinsall iOS pods.',
        defaultsTo: true,
        negatable: true,
      );
  }

  @override
  Future<void> run() async {
    final ios = argResults?['ios'] as bool;

    if (ios) {
      await runWithProgress('Running flutter clean...', () async {
        await Process.run('flutter', ['clean']);
      });

      await runWithProgress('Removing iOS pods...', () async {
        Directory podsDirectory = Directory('ios/Pods');
        File podfileLock = File('ios/Podfile.lock');

        if (podsDirectory.existsSync())
          await podsDirectory.delete(recursive: true);
        if (podfileLock.existsSync()) await podfileLock.delete();
      });

      await runWithProgress('Running flutter pub get...', () async {
        await Process.run('flutter', ['pub', 'get']);
      });

      await runWithProgress('Running pod install...', () async {
        Directory iosDirectory = Directory('ios');

        if (iosDirectory.existsSync()) {
          await Process.run('pod', ['install'], workingDirectory: 'ios');
        }
      });
    } else {
      await runWithProgress('Cleaning Flutter project...', () async {
        await Process.run('rm', ['pubspec.lock']);
        await Process.run('flutter', ['pub', 'get']);
      });
    }
  }
}
