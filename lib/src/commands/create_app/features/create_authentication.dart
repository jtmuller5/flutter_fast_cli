import 'dart:io';

import 'package:flutter_fast_cli/src/commands/create_app/features/utils.dart';
import 'package:flutter_fast_cli/src/commands/strings.dart';

Future<void> createAuthentication(String appName) async {

  Directory authenticationServicesDirectory;
  Directory authenticationUiDirectory;
  Directory authenticationModelsDirectory;

  (authenticationModelsDirectory, authenticationServicesDirectory, authenticationUiDirectory) = await createFeature('authentication');

  File fastUserFile = File('${authenticationModelsDirectory.path}/fast_user.dart');
  await fastUserFile.writeAsString(getFastUserText(appName), mode: FileMode.write);

  File authenticationServiceFile = File('${authenticationServicesDirectory.path}/authentication_service.dart');
  await authenticationServiceFile.writeAsString(getAuthenticationServiceText(appName), mode: FileMode.write);

  File fastAuthenticationServiceFile = File('${authenticationServicesDirectory.path}/fast_authentication_service.dart');
  await fastAuthenticationServiceFile.writeAsString(getFastAuthenticationServiceText(appName), mode: FileMode.write);

  File userServiceFile = File('${authenticationServicesDirectory.path}/user_service.dart');
  await userServiceFile.writeAsString(getUserServiceText(appName), mode: FileMode.write);

  File fastUserServiceFile = File('${authenticationServicesDirectory.path}/fast_user_service.dart');
  await fastUserServiceFile.writeAsString(getFastUserServiceText(appName), mode: FileMode.write);

  File signInFile = File('${authenticationUiDirectory.path}/sign_in_view.dart');
  await signInFile.writeAsString(getSignInViewText(appName), mode: FileMode.write);

  File registerFile = File('${authenticationUiDirectory.path}/register_view.dart');
  await registerFile.writeAsString(getRegisterViewText(appName), mode: FileMode.write);

  File profileFile = File('${authenticationUiDirectory.path}/profile_view.dart');
  await profileFile.writeAsString(getProfileViewText(appName), mode: FileMode.write);

  File forgotPasswordFile = File('${authenticationUiDirectory.path}/forgot_password_view.dart');
  await forgotPasswordFile.writeAsString(getForgotPasswordViewText(appName), mode: FileMode.write);
}
