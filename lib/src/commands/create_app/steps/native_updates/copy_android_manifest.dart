import 'dart:io';
import 'package:io/io.dart';

Future<void> copyAndroidManifest(String templatePath, String appName, String orgName) async {
  await copyPath('$templatePath/android', 'android');

  try {
    // Replace all instances of flutterfast with the app name
    final directory = Directory('android/app/src/main');

    await for (var entity in directory.list(recursive: true, followLinks: false)) {
      if (entity is File && entity.path.contains('AndroidManifest.xml')) {
        var content = await entity.readAsString();
        var modifiedContent = content.replaceAll('flutterfast', appName);
        modifiedContent = modifiedContent.replaceAll('com.cotr', orgName);

        await entity.writeAsString(modifiedContent);
      }
    }
  } catch (e) {
    stderr.writeln(e);
  }
}
