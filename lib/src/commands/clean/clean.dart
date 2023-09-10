import 'dart:io';

import 'package:args/args.dart';
import 'package:args/command_runner.dart';
import 'package:cli_util/cli_logging.dart';

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

    var logger = Logger.standard();

    if (ios) {
      var progress = logger.progress('Running flutter clean...');
      await Process.run('flutter', ['clean']);
      progress.finish(showTiming: true);

      progress = logger.progress('Removing pod files...');
      await Process.run('rm', ['-rf', 'Pods', 'Podfile.lock'], workingDirectory: 'ios');
      progress.finish(showTiming: true);

      progress = logger.progress('Running flutter pub get...');
      await Process.run('flutter', ['pub', 'get']);
      progress.finish(showTiming: true);

      progress = logger.progress('Running pod install...');
      await Process.run('pod', ['install'], workingDirectory: 'ios');
      progress.finish(showTiming: true);
    } else {
      var progress = logger.progress('Cleaning Flutter project...');
      await Process.run('rm', ['pubspec.lock']);
      await Process.run('flutter', ['pub', 'get']);
      progress.finish(showTiming: true);
    }
  }
}
