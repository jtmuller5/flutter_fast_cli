import 'dart:io';

import 'package:flutter_fast_cli/src/commands/create_app/steps/cleanup/remove_feature_from_file.dart';

Future<void> clearUnusedPaasFiles(String paas) async {
  Directory authenticationDirectory = Directory('lib/features/authentication/services');
  File firebaseAuthServiceFile = File('${authenticationDirectory.path}/authentication_service/firebase_authentication_service.dart');
  File supabaseAuthServiceFile = File('${authenticationDirectory.path}/authentication_service/supabase_authentication_service.dart');
  File appwriteAuthServiceFile = File('${authenticationDirectory.path}/authentication_service/appwrite_authentication_service.dart');
  File pocketbaseAuthServiceFile = File('${authenticationDirectory.path}/authentication_service/pocketbase_authentication_service.dart');
  File firebaseUserServiceFile = File('${authenticationDirectory.path}/user_service/firebase_user_service.dart');
  File supabaseUserServiceFile = File('${authenticationDirectory.path}/user_service/supabase_user_service.dart');
  File appwriteUserServiceFile = File('${authenticationDirectory.path}/user_service/appwrite_user_service.dart');
  File pocketbaseUserServiceFile = File('${authenticationDirectory.path}/user_service/pocketbase_user_service.dart');

  Directory feedbackDirectory = Directory('lib/features/feedback/services');
  File firebaseFeedbackServiceFile = File('${feedbackDirectory.path}/firebase_feedback_service.dart');
  File supabaseFeedbackServiceFile = File('${feedbackDirectory.path}/supabase_feedback_service.dart');
  File appwriteFeedbackServiceFile = File('${feedbackDirectory.path}/appwrite_feedback_service.dart');
  File pocketbaseFeedbackServiceFile = File('${feedbackDirectory.path}/pocketbase_feedback_service.dart');

  Directory connectorDirectory = Directory('lib/features/shared/services/connector_service');
  File firebaseConnectorServiceFile = File('${connectorDirectory.path}/firebase_connector_service.dart');
  File supabaseConnectorServiceFile = File('${connectorDirectory.path}/supabase_connector_service.dart');
  File appwriteConnectorServiceFile = File('${connectorDirectory.path}/appwrite_connector_service.dart');
  File pocketbaseConnectorServiceFile = File('${connectorDirectory.path}/pocketbase_connector_service.dart');

  if (paas == 'firebase') {
    await supabaseAuthServiceFile.delete();
    await supabaseUserServiceFile.delete();
    await supabaseFeedbackServiceFile.delete();
    await supabaseConnectorServiceFile.delete();
    await appwriteAuthServiceFile.delete();
    await appwriteUserServiceFile.delete();
    await appwriteFeedbackServiceFile.delete();
    await appwriteConnectorServiceFile.delete();
    await pocketbaseAuthServiceFile.delete();
    await pocketbaseUserServiceFile.delete();
    await pocketbaseFeedbackServiceFile.delete();
    await pocketbaseConnectorServiceFile.delete();
    // await removeDependencies('Supabase');
    // await removeDependencies('Appwrite');
  } else if (paas == 'supabase') {
    await firebaseAuthServiceFile.delete();
    await firebaseUserServiceFile.delete();
    await firebaseFeedbackServiceFile.delete();
    await firebaseConnectorServiceFile.delete();
    await appwriteAuthServiceFile.delete();
    await appwriteUserServiceFile.delete();
    await appwriteFeedbackServiceFile.delete();
    await appwriteConnectorServiceFile.delete();
    await deleteFirebaseFiles();
    await pocketbaseAuthServiceFile.delete();
    await pocketbaseUserServiceFile.delete();
    await pocketbaseFeedbackServiceFile.delete();
    await pocketbaseConnectorServiceFile.delete();
  } else if (paas == 'appwrite') {
    await firebaseAuthServiceFile.delete();
    await firebaseUserServiceFile.delete();
    await firebaseFeedbackServiceFile.delete();
    await firebaseConnectorServiceFile.delete();
    await supabaseAuthServiceFile.delete();
    await supabaseUserServiceFile.delete();
    await supabaseFeedbackServiceFile.delete();
    await supabaseConnectorServiceFile.delete();
    await deleteFirebaseFiles();
  } else if (paas == 'pocketbase') {
    await firebaseAuthServiceFile.delete();
    await firebaseUserServiceFile.delete();
    await firebaseFeedbackServiceFile.delete();
    await firebaseConnectorServiceFile.delete();
    await supabaseAuthServiceFile.delete();
    await supabaseUserServiceFile.delete();
    await supabaseFeedbackServiceFile.delete();
    await supabaseConnectorServiceFile.delete();
    await deleteFirebaseFiles();
    await appwriteAuthServiceFile.delete();
    await appwriteUserServiceFile.delete();
    await appwriteFeedbackServiceFile.delete();
    await appwriteConnectorServiceFile.delete();
  } else {
    stdout.writeln('Unknown PaaS: $paas');
  }
}

Future<void> removeDependencies(String tag) async {
  var pubspec = await File('pubspec.yaml').readAsString();
  var modifiedContent = pubspec.replaceAll('#* $tag *#', '');
  await File('pubspec.yaml').writeAsString(modifiedContent);
}

Future<void> deleteFirebaseFiles() async {
  await removeFeatureFromFile('Chat', 'lib/app/router.dart');
  await removeFeatureFromFile('Chat', 'lib/app/services.dart');

  Directory chatLibDirectory = Directory('lib/modules/chat');
  if (await chatLibDirectory.exists()) {
    await chatLibDirectory.delete(recursive: true);
  }

  Directory rowyDirectory = Directory('lib/features/shared/models/rowy');

  if (await rowyDirectory.exists()) {
    await rowyDirectory.delete(recursive: true);
  }

  Directory firebaseDirectory = Directory('lib/features/shared/models/firebase');

  if (await firebaseDirectory.exists()) {
    await firebaseDirectory.delete(recursive: true);
  }

  File firebaseOptions = File('lib/firebase_options.dart');
  if (await firebaseOptions.exists()) {
    await firebaseOptions.delete();
  }
}
