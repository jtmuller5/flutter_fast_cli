import 'dart:io';

import 'package:flutter_fast_cli/src/commands/create_app/steps/cleanup/remove_feature_from_file.dart';

Future<void> removeSubscriptionFeature() async {
  Directory subscriptionsDirectory = Directory('lib/features/subscriptions');

  if (await subscriptionsDirectory.exists()) {
    await subscriptionsDirectory.delete(recursive: true);
  }

  await removeFeatureFromFile('Subscriptions', 'pubspec.yaml');
  await removeFeatureFromFile('Subscriptions', 'lib/app/services.dart');
  await removeFeatureFromFile('Subscriptions', 'lib/main.dart');
  await removeFeatureFromFile('Subscriptions', 'lib/features/home/ui/home/widgets/drawer.dart');
  await removeFeatureFromFile('Subscriptions', 'lib/app/router.dart');
}
