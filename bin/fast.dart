import 'package:args/command_runner.dart';
import 'package:flutter_fast_cli/src/bricks/bricks.dart';
import 'package:flutter_fast_cli/src/bricks/fast_ads.dart';
import 'package:flutter_fast_cli/src/commands/build/build.dart';
import 'package:flutter_fast_cli/src/commands/commands.dart';
import 'package:flutter_fast_cli/src/commands/setup/setup.dart';
import 'package:flutter_fast_cli/src/commands/update/update.dart';

void main(List<String> arguments) {
  CommandRunner(
    "fast",
    "CLI for building Flutter apps fast",
  )
    ..addCommand(Setup())
    ..addCommand(CreateApp())
    ..addCommand(Build())
    ..addCommand(Update())
    ..addCommand(FastBricks())
    ..addCommand(FastAds())
    ..run(arguments);
}
