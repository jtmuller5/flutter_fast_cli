import 'dart:io';

Future<void> main() async {
  await copyAndReplace(
    '../templates/online/flutterfast_online_auth',
    '../flutterfast_bricks/bricks/fast_app_online_auth/__brick__',
  );

  /* await copyAndReplace(
    '../templates/online/flutterfast_online_no_auth',
    '../flutterfast_bricks/bricks/fast_app_online_no_auth/__brick__',
  ); */

  await copyAndReplace(
    '../templates/offline/flutterfast_offline',
    '../flutterfast_bricks/bricks/fast_app_offline/__brick__',
  );
}

Future<void> copyAndReplace(
  String sourceDir,
  String destDir,
) async {
  final sourceDirectory = Directory(sourceDir);
  final destinationDirectory = Directory(destDir);

  if (!await sourceDirectory.exists()) {
    print('Source directory does not exist');
    return;
  }

  if (await destinationDirectory.exists()) {
    await destinationDirectory.delete(recursive: true);
  }

  if (!await destinationDirectory.exists()) {
    await destinationDirectory.create(recursive: true);
  }

  // List of directory names to skip
  final skipDirectories = ['/.git', '/.dart_tool/', '/build/', '/node_modules/'];

  await for (var entity in sourceDirectory.list(recursive: true)) {
    if (skipDirectories.any((dir) => entity.path.contains(dir))) {
      continue;
    }

    if (entity is File) {
      try {
        final relativePath = entity.path.replaceFirst(sourceDirectory.path, '');
        final newFilePath = destinationDirectory.path + relativePath;
        final newFile = File(newFilePath);

        await newFile.create(recursive: true);

        if (entity.path.endsWith('.lock')) {
          continue;
        }

        if (entity.path.endsWith('.png') ||
            entity.path.endsWith('.jpg') ||
            entity.path.endsWith('.jpeg') ||
            entity.path.endsWith('.gif') ||
            entity.path.endsWith('.bin') ||
            entity.path.endsWith('.probe') ||
            entity.path.endsWith('.ico') ||
            entity.path.endsWith('.der') ||
            entity.path.endsWith('.jar')) {
          // If the file is an image, just copy it
          await entity.copy(newFilePath);
        } else {
          // Otherwise, read it as a string and replace content
          String content = await entity.readAsString();
          if(sourceDir.contains('offline')) {
            content = content.replaceAll('flutterfast_offline', '{{ name }}');
          } else {
            content = content.replaceAll('flutterfast_online_auth', '{{ name }}');
          }
          
          content = content.replaceAll('com.cotr', '{{ org }}');
          await newFile.writeAsString(content);
        }
      } catch (e) {
        print(e);
      }
    } else if (entity is Directory) {
      final relativePath = entity.path.replaceFirst(sourceDirectory.path, '');
      final newDirPath = destinationDirectory.path + relativePath;
      final newDir = Directory(newDirPath);
      await newDir.create(recursive: true);
    }
  }

  print('Files copied and names replaced successfully.');
}
