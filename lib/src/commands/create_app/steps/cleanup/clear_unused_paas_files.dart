import 'dart:io';

Future<void> clearUnusedPaasFiles(String paas) async {
  Directory authenticationDirectory = Directory('lib/features/authentication/services');
  File firebaseAuthServiceFile = File('${authenticationDirectory.path}/firebase_authentication_service.dart');
  File supabaseAuthServiceFile = File('${authenticationDirectory.path}/authentication_service/supabase_authentication_service.dart');
  File appwriteAuthServiceFile = File('${authenticationDirectory.path}/authentication_service/appwrite_authentication_service.dart');
  File firebaseUserServiceFile = File('${authenticationDirectory.path}/user_service/firebase_user_service.dart');
  File supabaseUserServiceFile = File('${authenticationDirectory.path}/user_service/supabase_user_service.dart');
  File appwriteUserServiceFile = File('${authenticationDirectory.path}/user_service/appwrite_user_service.dart');

  Directory feedbackDirectory = Directory('lib/features/feedback/services');
  File firebaseFeedbackServiceFile = File('${feedbackDirectory.path}/firebase_feedback_service.dart');
  File supabaseFeedbackServiceFile = File('${feedbackDirectory.path}/supabase_feedback_service.dart');
  File appwriteFeedbackServiceFile = File('${feedbackDirectory.path}/appwrite_feedback_service.dart');

  Directory connectorDirectory = Directory('lib/features/shared/services/connector_service');
  File firebaseConnectorServiceFile = File('${connectorDirectory.path}/firebase_connector_service.dart');
  File supabaseConnectorServiceFile = File('${connectorDirectory.path}/supabase_connector_service.dart');
  File appwriteConnectorServiceFile = File('${connectorDirectory.path}/appwrite_connector_service.dart');

  if (paas == 'firebase') {
    await supabaseAuthServiceFile.delete();
    await supabaseUserServiceFile.delete();
    await supabaseFeedbackServiceFile.delete();
    await supabaseConnectorServiceFile.delete();
    await appwriteAuthServiceFile.delete();
    await appwriteUserServiceFile.delete();
    await appwriteFeedbackServiceFile.delete();
    await appwriteConnectorServiceFile.delete();
  } else if (paas == 'supabase') {
    await firebaseAuthServiceFile.delete();
    await firebaseUserServiceFile.delete();
    await firebaseFeedbackServiceFile.delete();
    await firebaseConnectorServiceFile.delete();
    await appwriteAuthServiceFile.delete();
    await appwriteUserServiceFile.delete();
    await appwriteFeedbackServiceFile.delete();
    await appwriteConnectorServiceFile.delete();
  } else if (paas == 'appwrite') {
    await firebaseAuthServiceFile.delete();
    await firebaseUserServiceFile.delete();
    await firebaseFeedbackServiceFile.delete();
    await firebaseConnectorServiceFile.delete();
    await supabaseAuthServiceFile.delete();
    await supabaseUserServiceFile.delete();
    await supabaseFeedbackServiceFile.delete();
    await supabaseConnectorServiceFile.delete();
  } else {
    stdout.writeln('Unknown PaaS: $paas');
  }
}
