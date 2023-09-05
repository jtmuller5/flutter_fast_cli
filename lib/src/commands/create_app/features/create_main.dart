import 'dart:io';

import 'package:flutter_fast_cli/src/strings/strings.dart';

void createMain(){
  File mainFile = File('main.dart');
  mainFile.writeAsString(getMainText(), mode: FileMode.write);
}