import 'dart:io';

Future<void> main() async {
  // Step 1: Run createBricks.dart
  var result = await Process.run('dart', ['run', 'createBricks.dart']);
  stdout.write(result.stdout);
  stderr.write(result.stderr);

  // Step 2: Change directory to the parent directory
  Directory.current = Directory.current.parent;
  print('Changed directory to: ${Directory.current.path}');

  // Step 3: Change directory to flutterfast_bricks/bricks
  Directory.current = Directory('${Directory.current.path}/flutterfast_bricks/bricks');
  print('Changed directory to: ${Directory.current.path}');

  // Step 4: Run mason bundle for fast_app_online_auth
  result = await Process.run('mason', ['bundle', './fast_app_online_auth', '-t', 'dart', '-o', '../bundles']);
  stdout.write(result.stdout);
  stderr.write(result.stderr);

  // Step 5: Run mason bundle for fast_app_offline
  result = await Process.run('mason', ['bundle', './fast_app_offline', '-t', 'dart', '-o', '../bundles']);
  stdout.write(result.stdout);
  stderr.write(result.stderr);

  // Step 6: Copy the new bundle files to /lib/src/bundles
  final sourceDir = Directory('${Directory.current.path}/../bundles');
  final destinationDir = Directory('${Directory.current.path}/../../lib/src/bundles');

  if (!await destinationDir.exists()) {
    await destinationDir.create(recursive: true);
  }

  await for (var entity in sourceDir.list(recursive: false)) {
    if (entity is File) {
      final newFilePath = '${destinationDir.path}/${entity.uri.pathSegments.last}';
      await entity.copy(newFilePath);
      print('Copied ${entity.path} to $newFilePath');
    }
  }

  print('All steps completed successfully.');
}