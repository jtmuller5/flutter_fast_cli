import 'dart:io';

Future<void> createTests() async {
  var testDirectory = await Directory('test').create();
  var testUtilsDirectory = await Directory('${testDirectory.path}/utils').create();
}