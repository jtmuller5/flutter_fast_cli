import 'dart:io';

Future<void> createSubscriptions() async {
  var featuresDirectory = Directory('features');

  var subscriptionsDirectory = await Directory('${featuresDirectory.path}/subscriptions').create();
  var subscriptionsServicesDirectory = await Directory('${subscriptionsDirectory.path}/services').create();
  var subscriptionsUiDirectory = await Directory('${subscriptionsDirectory.path}/ui').create();
}