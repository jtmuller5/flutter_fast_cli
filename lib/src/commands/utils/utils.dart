import 'dart:io';

import 'package:cli_util/cli_logging.dart';
import 'package:recase/recase.dart';

Future<void> runWithProgress(String stepName, Function command) async {
  var logger = Logger.standard();

  var progress = logger.progress(stepName);
  try {
    await command();
  } catch (e) {
    rethrow;
  }
  progress.finish(showTiming: true);
}

String get flutterPath => 'flutter${Platform.isWindows ? '.bat' : ''}';

String? navigateToFeaturesFolder(Directory currentDirectory, {String? featureName}) {
  if (currentDirectory.listSync().any((element) => element is Directory && element.path.split('/').last == 'lib')) {
    // Navigate into lib directory
    currentDirectory = Directory('${currentDirectory.path}/lib');
    stdout.write('Navigating to lib directory...\n');
  }

  if (currentDirectory.listSync().any((element) => element is Directory && element.path.split('/').last == 'features')) {
    // Navigate into lib directory
    currentDirectory = Directory('${currentDirectory.path}/features');
    stdout.write('Navigating to features directory...\n');
  }

  if (currentDirectory.path.contains('lib/features') && currentDirectory.path.split('/').last != 'features') {
    // Navigate to features directory
    stdout.write('Navigating to features directory...\n');
    while (!currentDirectory.path.endsWith('features')) {
      if (currentDirectory.parent.path.split('/').last == 'features' && featureName == null) {
        featureName = currentDirectory.path.split('/').last;
      }

      currentDirectory = currentDirectory.parent;
      if (currentDirectory.path == currentDirectory.parent.path) {
        throw Exception('Could not find features folder');
      }
    }
  }

  if (featureName != null) {
    currentDirectory = Directory('${currentDirectory.path}/${ReCase(featureName).camelCase}');
  }

  return currentDirectory.path;
}
