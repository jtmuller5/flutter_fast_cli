import 'dart:io';

Future<void> removeFeatureFromFile(String feature, String filePath) async {
  File file = File(filePath);

  String fileContents = await file.readAsString();

  String hashRegExpString = r'#\*' ' $feature ' r'\*#.*#\*' ' $feature ' r'\*#';
  String slashRegExpString = r'//\*' ' $feature ' r'\*//.*//\*' ' $feature ' r'\*//';
  String slashXRegExpString = r'//x' ' $feature ' r'x//.*//x' ' $feature ' r'x//';

  RegExp featureRegExp = RegExp(hashRegExpString, multiLine: true, dotAll: true);
  String? featureContent = featureRegExp.stringMatch(fileContents);
  if (featureContent != null) {
    fileContents = fileContents.replaceAll(featureContent, '');
  }

  featureRegExp = RegExp(slashRegExpString, multiLine: true, dotAll: true);
  featureContent = featureRegExp.stringMatch(fileContents);
  if (featureContent != null) {
    fileContents = fileContents.replaceAll(featureContent, '');
  }

  featureRegExp = RegExp(slashXRegExpString, multiLine: true, dotAll: true);
  featureContent = featureRegExp.stringMatch(fileContents);
  if (featureContent != null) {
    fileContents = fileContents.replaceAll(featureContent, '');
  }

  await file.writeAsString(fileContents, mode: FileMode.write);
}
