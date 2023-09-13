import 'dart:io';

import 'package:flutter_fast_cli/src/commands/strings.dart';

Future<void> updatePubspecFile(String appName, String paas) async {
  File pubspec = File('pubspec.yaml');

  String pubspecContents = getPubspecText(appName);

  if (paas == 'firebase') {
    removePubspecSection('Supabase');
    removePubspecSection('Appwrite');
  } else if (paas == 'supabase') {
    removePubspecSection('Firebase');
    removePubspecSection('Appwrite');
  } else if (paas == 'appwrite') {
    removePubspecSection('Firebase');
    removePubspecSection('Supabase');
  } else {
    stdout.writeln('Unknown PaaS: $paas');
  }

  await pubspec.writeAsString(pubspecContents);
}

void removePubspecSection(String section){
  // Locate contents between # Section tags
  RegExp regExp = RegExp(r'#\* $section \*#.*#\* $section \*#', multiLine: true, dotAll: true);
  String contents = regExp.stringMatch(getPubspecText(''))!;
  String pubspecContents = getPubspecText('').replaceAll(contents, '');
  File pubspec = File('pubspec.yaml');
  pubspec.writeAsString(pubspecContents);
}
