import 'dart:io';

Future<void> removeRunConfigurations() async {
  Directory runConfigurationsDirectory = Directory('runConfigurations');

  if (await runConfigurationsDirectory.exists()) {
    await runConfigurationsDirectory.delete(recursive: true);
  }
}
