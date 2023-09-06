import 'dart:io';

import 'package:flutter_fast_cli/src/commands/create_app/features/utils.dart';
import 'package:flutter_fast_cli/src/strings/authentication_service.dart';
import 'package:flutter_fast_cli/src/strings/authentication_ui.dart';
import 'package:flutter_fast_cli/src/strings/strings.dart';
import 'package:flutter_fast_cli/src/strings/user_service.dart';

Future<void> createAuthentication(String appName) async {

  Directory authenticationServicesDirectory;
  Directory authenticationUiDirectory;
  Directory authenticationModelsDirectory;

  (authenticationModelsDirectory, authenticationUiDirectory, authenticationServicesDirectory) = createFeature('authentication');

  File fastUserFile = File('${authenticationModelsDirectory.path}/fast_user.dart');
  await fastUserFile.writeAsString(getFastUserText(appName), mode: FileMode.write);

  File authenticationServiceFile = File('${authenticationServicesDirectory.path}/authentication_service.dart');
  await authenticationServiceFile.writeAsString(getAuthenticationServiceText(appName), mode: FileMode.write);

  File fastAuthenticationServiceFile = File('${authenticationServicesDirectory.path}/fast_authentication_service.dart');
  await fastAuthenticationServiceFile.writeAsString(getFastAuthenticationServiceText(), mode: FileMode.write);

  File userServiceFile = File('${authenticationServicesDirectory.path}/user_service.dart');
  await userServiceFile.writeAsString(getUserServiceText(appName), mode: FileMode.write);

  File fastUserServiceFile = File('${authenticationServicesDirectory.path}/fast_user_service.dart');
  await fastUserServiceFile.writeAsString(getFastUserServiceText(appName), mode: FileMode.write);

  File signInFile = File('${authenticationUiDirectory.path}/sign_in_view.dart');
  await signInFile.writeAsString(getSignInText(appName), mode: FileMode.write);

  File registerFile = File('${authenticationUiDirectory.path}/register_view.dart');
  await registerFile.writeAsString(getRegisterText(appName), mode: FileMode.write);

  File profileFile = File('${authenticationUiDirectory.path}/profile_view.dart');
  await profileFile.writeAsString(getProfileText(appName), mode: FileMode.write);

  File forgotPasswordFile = File('${authenticationUiDirectory.path}/forgot_password_view.dart');
  await forgotPasswordFile.writeAsString(getForgotPasswordText(), mode: FileMode.write);
}
