import 'dart:io';

import 'package:flutter_fast_cli/src/commands/create_app/features/utils.dart';
import 'package:flutter_fast_cli/src/commands/strings.dart';

Future<void> createSubscriptions(String appName) async {
  Directory servicesDirectory;
  Directory uiDirectory;
  Directory modelsDirectory;

  (modelsDirectory, servicesDirectory, uiDirectory) = await createFeature('subscriptions');

  await Directory('features/subscriptions/ui/subscription/widgets').create(recursive: true);

  File subscriptionsViewFile = File('${uiDirectory.path}/subscription/subscription_view.dart');
  await subscriptionsViewFile.writeAsString(getSubscriptionViewText(appName), mode: FileMode.write);

  File subscriptionsViewModelFile = File('${uiDirectory.path}/subscription/subscription_view_model.dart');
  await subscriptionsViewModelFile.writeAsString(getSubscriptionViewModelText(appName), mode: FileMode.write);

  File featureCardFile = File('${uiDirectory.path}/subscription/widgets/feature_card.dart');
  await featureCardFile.writeAsString(getFeatureCardText(appName), mode: FileMode.write);

  File planCardFile = File('${uiDirectory.path}/subscription/widgets/plan_card.dart');
  await planCardFile.writeAsString(getPlanCardText(appName), mode: FileMode.write);

  File subscriptionServiceFile = File('${servicesDirectory.path}/subscription_service.dart');
  await subscriptionServiceFile.writeAsString(getSubscriptionServiceText(appName), mode: FileMode.write);
}