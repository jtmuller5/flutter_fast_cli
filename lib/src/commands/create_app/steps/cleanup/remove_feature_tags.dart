import 'dart:io';

Future<void> removeFeatureTags() async {
  try {
    // Replace all instances of feature tags with empty string
    for (String tag in [
      'Firebase',
      'Supabase',
      'RSS',
      'LogoColorScheme',
      'Subscriptions',
      'Appwrite',
      'Pocketbase'
    ]) {
      final directory = Directory('lib');

      await for (var entity
          in directory.list(recursive: true, followLinks: false)) {
        if (entity is File) {
          var content = await entity.readAsString();
          var modifiedContent = content.replaceAll('//* $tag *//', '');
          await entity.writeAsString(modifiedContent);
        }
      }

      await for (var entity
          in directory.list(recursive: true, followLinks: false)) {
        if (entity is File) {
          var content = await entity.readAsString();
          var modifiedContent = content.replaceAll('//x $tag x//', '');
          await entity.writeAsString(modifiedContent);
        }
      }

      /*var pubspec = await File('pubspec.yaml').readAsString();
      var modifiedContent = pubspec.replaceAll('#* $tag *#', '');
      await File('pubspec.yaml').writeAsString(modifiedContent);*/
    }
  } catch (e) {
    stderr.writeln(e);
  }
}
