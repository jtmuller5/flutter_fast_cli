import 'dart:convert';
import 'dart:io';

import 'package:args/args.dart';
import 'package:args/command_runner.dart';
import 'package:flutter_fast_cli/src/commands/utils/analytics.dart';

/// A command to run `flutter pub run build_runner build --delete-conflicting-outputs`.
class Build extends Command {
  @override
  String get description => 'Run flutter pub run build_runner build --delete-conflicting-outputs.';

  @override
  String get name => 'build';

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
    stdout.write('Running build_runner...\n');
    logAmplitudeEvent('command', {'command': 'build'});

    Process process = await Process.start('dart', ['run', 'build_runner', 'build', '--delete-conflicting-outputs']);

    process.stdout.transform(utf8.decoder).listen((data) {
      stdout.write(data);
    });
  }
}
