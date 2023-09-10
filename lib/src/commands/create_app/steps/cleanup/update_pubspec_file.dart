import 'dart:io';

import 'package:flutter_fast_cli/src/commands/strings.dart';

Future<void> updatePubspecFile(String appName, String paas) async {
  File pubspec = File('pubspec.yaml');

  String pubspecContents = getPubspecText(appName);

  if (paas == 'firebase') {
    // Locate contents between # Supabase tags
    RegExp supabaseRegExp = RegExp(r'#\* Supabase \*#.*#\* Supabase \*#',
        multiLine: true, dotAll: true);
    String supabaseContents = supabaseRegExp.stringMatch(pubspecContents)!;
    pubspecContents = pubspecContents.replaceAll(supabaseContents, '');
  } else if (paas == 'supabase') {
    // Locate contents between # Firebase tags
    RegExp firebaseRegExp = RegExp(r'#\* Firebase \*#.*#\* Firebase \*#',
        multiLine: true, dotAll: true);
    String firebaseContents = firebaseRegExp.stringMatch(pubspecContents)!;
    pubspecContents = pubspecContents.replaceAll(firebaseContents, '');
  } else {
    stdout.writeln('Unknown PaaS: $paas');
  }

  await pubspec.writeAsString(pubspecContents);
}
