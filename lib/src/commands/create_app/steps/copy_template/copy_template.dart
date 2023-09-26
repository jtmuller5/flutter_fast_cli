import 'dart:io';
import 'package:io/io.dart';

Future<void> copyTemplate(String templatePath, String appName) async {
  Directory.current = Directory(appName);
  await copyPath('$templatePath/lib', 'lib');

  try {
    // Replace all instances of flutterfast with the app name
    final directory = Directory('lib');

    await for (var entity
        in directory.list(recursive: true, followLinks: false)) {
      if (entity is File) {
        var content = await entity.readAsString();
        var modifiedContent = content.replaceAll('flutterfast', appName);
        await entity.writeAsString(modifiedContent);
      }
    }
  } catch (e) {
    stderr.writeln(e);
  }
}
