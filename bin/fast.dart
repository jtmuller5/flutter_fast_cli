import 'package:args/command_runner.dart';
import 'package:flutter_fast_cli/src/commands/commands.dart';

void main(List<String> arguments) {
  CommandRunner(
    "fast",
    "CLI for building Flutter apps fast",
  )
    ..addCommand(CreateApp())
    ..run(arguments);
}