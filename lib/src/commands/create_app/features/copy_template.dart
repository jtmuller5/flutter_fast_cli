import 'dart:io';
import 'package:io/io.dart';

Future<void> copyTemplate(String appName) async {
  Directory.current = Directory(appName);
  await copyPath('../template/lib', 'lib');

  try {
    // Replace all instances of template with the app name
    // find lib -type f -exec sed -i "" "s/template/test/" {} \;
    ProcessResult out = await Process.run(
      'find',
      ['lib', '-type', 'f', '-exec', 'sed', '-i', '', 's/template/$appName/', '{}', ';'],
      workingDirectory: Directory.current.path,
    );
    if (out.stdout != null && out.stdout != '') stdout.write(out.stdout);
    if (out.stderr != null && out.stderr != '') stderr.write(out.stderr);
  } catch (e) {
    stderr.writeln(e);
  }
}
