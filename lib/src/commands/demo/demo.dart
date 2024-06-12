import 'dart:io';

import 'package:args/command_runner.dart';

class Demo extends Command {
  @override
  String get description => 'Read a local demo file.';

  @override
  String get name => 'demo';

  @override
  Future<void> run() async {
    String? demoText = File('flutter_fast_cli/src/bundles/demo.txt').readAsStringSync();

    stdout.write(demoText);
  }
}
