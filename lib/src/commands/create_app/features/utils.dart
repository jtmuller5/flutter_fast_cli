import 'dart:io';

/// Return Models, Services, and UI directories
(Directory, Directory, Directory) createFeature(String name){
  var featuresDirectory = Directory('features');

  var featureDirectory = Directory('${featuresDirectory.path}/$name');
  var featureServicesDirectory = Directory('${featureDirectory.path}/services');
  var featureUiDirectory = Directory('${featureDirectory.path}/ui');
  var featureModelsDirectory = Directory('${featureDirectory.path}/models');

  return (featureModelsDirectory, featureServicesDirectory, featureUiDirectory);
}