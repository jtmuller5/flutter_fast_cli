import 'dart:cli';
import 'dart:io';
import 'dart:isolate';

Future<String?> loadTemplateFolder() async{
  final packageUri = Uri.parse('package:flutter_fast_cli/src');
  final future = Isolate.resolvePackageUri(packageUri);

  final absoluteUri = await future;

  final directory = Directory.fromUri(absoluteUri!);
  if (directory.existsSync()) {

    Directory templateDirectory = Directory.fromUri(absoluteUri.resolve('../template'));

    return templateDirectory.path;
  }
  return null;
}