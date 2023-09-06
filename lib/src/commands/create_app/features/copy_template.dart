import 'dart:io' ;
import 'package:io/io.dart';

Future<void> copyTemplate(String appName) async {
  ProcessResult result = await Process.run('ls', []);
  print(result.stdout);
  Directory.current = Directory(appName);
  copyPath('../template/lib', 'lib');

  // Replace all instances of template with the app name
  Process.runSync('find', ['.', '-type', 'f', '-exec', 'sed', '-i', 's/template/$appName/g', '{}', ';']);
}