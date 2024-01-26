import 'dart:io';

import 'package:flutter_fast_cli/src/commands/strings.dart';

Future<void> updatePubspecFile(String appName, String paas) async {
  File pubspec = File('pubspec.yaml');

  String pubspecContents = getPubspecText(appName);

  if (paas == 'firebase') {
    pubspecContents = await removePubspecSection('Supabase', pubspecContents);
    pubspecContents = await removePubspecSection('Appwrite', pubspecContents);
    pubspecContents = await removePubspecSection('Pocketbase', pubspecContents);
  } else if (paas == 'supabase') {
    pubspecContents = await removePubspecSection('Firebase', pubspecContents);
    pubspecContents = await removePubspecSection('Appwrite', pubspecContents);
    pubspecContents = await removePubspecSection('Pocketbase', pubspecContents);
  } else if (paas == 'appwrite') {
    pubspecContents = await removePubspecSection('Firebase', pubspecContents);
    pubspecContents = await removePubspecSection('Supabase', pubspecContents);
    pubspecContents = await removePubspecSection('Pocketbase', pubspecContents);
  } else if (paas == 'pocketbase') {
    pubspecContents = await removePubspecSection('Firebase', pubspecContents);
    pubspecContents = await removePubspecSection('Supabase', pubspecContents);
    pubspecContents = await removePubspecSection('Appwrite', pubspecContents);
  } else {
    stdout.writeln('Unknown PaaS: $paas');
  }

  await pubspec.writeAsString(pubspecContents);
}

Future<String> removePubspecSection(String section, String pubspec) async {
  // Locate contents between # Section tags
  RegExp regExp = RegExp(r'#\* ' + section + r' \*#.*#\* ' + section + r' \*#', multiLine: true, dotAll: true);
  String? contents = regExp.stringMatch(pubspec);
  if (contents != null) {
    String pubspecContents = pubspec.replaceAll(contents, '');
    return pubspecContents;
  } else {
    return pubspec;
  }
}
