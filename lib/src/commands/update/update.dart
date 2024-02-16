import 'dart:convert';
import 'dart:io';
import 'package:args/command_runner.dart';
import 'package:flutter_fast_cli/src/commands/utils/analytics.dart';

class Update extends Command {
  @override
  String get description => 'Update the flutter_fast_cli to the latest version.';

  @override
  String get name => 'update';

  @override
  Future<void> run() async {
    stdout.write('Updating flutter_fast_cli...\n');
    logAmplitudeEvent('command', {'command': 'update'});

    Process process = await Process.start('dart', ['pub', 'global', 'activate', 'flutter_fast_cli']);

    process.stdout.transform(utf8.decoder).listen((data) {
      stdout.write(data);
    });
  }
}
