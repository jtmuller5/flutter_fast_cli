import 'package:io/io.dart';

Future<void> copyIosFiles(String templatePath) async {
  await copyPath('$templatePath/ios', 'ios');
}
