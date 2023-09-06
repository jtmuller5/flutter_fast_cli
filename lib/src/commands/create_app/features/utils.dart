import 'dart:io';

/// Return Models, Services, and UI directories
Future<(Directory, Directory, Directory)> createFeature(String name) async {
  var featuresDirectory = Directory('features');

  var featureDirectory = await Directory('${featuresDirectory.path}/$name').create();
  var featureServicesDirectory = await Directory('${featureDirectory.path}/services').create();
  var featureUiDirectory = await Directory('${featureDirectory.path}/ui').create();
  var featureModelsDirectory = await Directory('${featureDirectory.path}/models').create();

  return (featureModelsDirectory, featureServicesDirectory, featureUiDirectory);
}
