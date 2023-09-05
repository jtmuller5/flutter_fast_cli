import 'dart:io';

Future<void> createAuthentication() async {
  var featuresDirectory = Directory('features');

  var authenticationDirectory = await Directory('${featuresDirectory.path}/authentication').create();
  var authenticationServicesDirectory = await Directory('${authenticationDirectory.path}/services').create();
  var authenticationUiDirectory = await Directory('${authenticationDirectory.path}/ui').create();


}