import 'dart:io';

Future<void> removeInjectableEnvironments() async {
  File getIt = File('lib/app/get_it.dart');

  String getItContents = File('lib/app/get_it.dart').readAsStringSync();

  getItContents = getItContents.replaceAll(
      'environment: const String.fromEnvironment(\'PAAS\', defaultValue: \'firebase\'),',
      '');
  getItContents = getItContents.replaceAll(
      'const firebase = Environment(\'firebase\');', '');
  getItContents = getItContents.replaceAll(
      'const supabase = Environment(\'supabase\');', '');
  getItContents = getItContents.replaceAll(
      'const appwrite = Environment(\'appwrite\');', '');

  await getIt.writeAsString(getItContents);

  for (String environment in ['firebase', 'supabase', 'appwrite']) {
    await Process.run(
      'find',
      [
        'lib',
        '-type',
        'f',
        '-exec',
        'sed',
        '-i',
        '',
        's/@$environment//',
        '{}',
        ';'
      ],
      workingDirectory: Directory.current.path,
    );
  }
}
