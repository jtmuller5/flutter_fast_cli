import 'dart:io';
import 'package:io/io.dart';

Future<void> copyTemplate(String templatePath, String appName) async {
  Directory.current = Directory(appName);
  await copyPath('$templatePath/lib', 'lib');

  try {
    // Replace all instances of flutterfast with the app name
    ProcessResult out = await Process.run(
      'find',
      ['lib', '-type', 'f', '-exec', 'sed', '-i', '', 's/flutterfast/$appName/', '{}', ';'],
      workingDirectory: Directory.current.path,
    );
    if (out.stdout != null && out.stdout != '') stdout.write(out.stdout);
    if (out.stderr != null && out.stderr != '') stderr.write(out.stderr);
  } catch (e) {
    stderr.writeln(e);
  }
}
