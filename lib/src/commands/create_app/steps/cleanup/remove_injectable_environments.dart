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
    final directory = Directory('lib');

    await for (var entity
        in directory.list(recursive: true, followLinks: false)) {
      if (entity is File) {
        var content = await entity.readAsString();
        var modifiedContent = content.replaceAll('@$environment', '');
        await entity.writeAsString(modifiedContent);
      }
    }
  }
}
