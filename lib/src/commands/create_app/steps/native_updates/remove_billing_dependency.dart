import 'dart:io';

Future<void> removeBillingDependency(
    String templatePath, String appName) async {
  File buildGradleFile = File('android/app/build.gradle');

  String buildGradleContent = await buildGradleFile.readAsString();

  RegExp subscriptionRegExp = RegExp(
      r'//\* Subscriptions \*//.*//\* Subscriptions \*//',
      multiLine: true,
      dotAll: true);
  String subscriptionContents =
      subscriptionRegExp.stringMatch(buildGradleContent)!;
  buildGradleContent = buildGradleContent.replaceAll(subscriptionContents, '');

  await buildGradleFile.writeAsString(buildGradleContent);
}
