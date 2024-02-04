import 'package:args/command_runner.dart';
import 'package:flutter_fast_cli/src/commands/build/build.dart';
import 'package:flutter_fast_cli/src/commands/commands.dart';
import 'package:flutter_fast_cli/src/commands/feature/feature.dart';
import 'package:flutter_fast_cli/src/commands/update/update.dart';
import 'package:flutter_fast_cli/src/commands/view/view.dart';
import 'package:flutter_fast_cli/src/commands/wizard/wizard.dart';

void main(List<String> arguments) {
  CommandRunner(
    "fast",
    "CLI for building Flutter apps fast",
  )
    ..addCommand(CreateApp())
    ..addCommand(Wizard())
    ..addCommand(Clean())
    ..addCommand(Build())
    ..addCommand(Feature())
    ..addCommand(View())
    ..addCommand(Update())
    ..run(arguments);
}
