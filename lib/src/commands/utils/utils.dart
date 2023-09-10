import 'package:cli_util/cli_logging.dart';

Future<void> runWithProgress(String stepName, Function command) async {
  var logger = Logger.standard();

  var progress = logger.progress(stepName);
  await command();
  progress.finish(showTiming: true);
}
