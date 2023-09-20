import 'dart:io';
import 'dart:isolate';

Future<String?> loadTemplateFolder(bool offline) async {
  final packageUri = Uri.parse('package:flutter_fast_cli/src');
  final future = Isolate.resolvePackageUri(packageUri);

  final absoluteUri = await future;

  final directory = Directory.fromUri(absoluteUri!);
  if (directory.existsSync()) {
    Directory templateDirectory = offline
        ? Directory.fromUri(absoluteUri.resolve('../flutterfast_offline'))
        : Directory.fromUri(absoluteUri.resolve('../flutterfast'));

    return templateDirectory.path;
  }
  return null;
}
