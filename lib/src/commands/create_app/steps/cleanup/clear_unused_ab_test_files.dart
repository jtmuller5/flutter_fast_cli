import 'dart:io';

Future<void> clearUnusedAbTestFiles(String abTests) async {
  Directory abTestDirectory = Directory('lib/features/ab_testing/services');
  File firebaseAbTestServiceFile = File('${abTestDirectory.path}/firebase_ab_test_service.dart');
  File posthogAbTestServiceFile = File('${abTestDirectory.path}/posthog_ab_test_service.dart');

  if (abTests == 'firebase') {
    await posthogAbTestServiceFile.delete();
  } else if (abTests == 'posthog') {
    await firebaseAbTestServiceFile.delete();
  } else {
    stdout.writeln('Unknown AB Test Plaform: $abTests');
  }
}
