import 'dart:io';

import 'package:flutter_fast_cli/src/commands/create_app/features/utils.dart';
import 'package:flutter_fast_cli/src/strings/authentication_service.dart';
import 'package:flutter_fast_cli/src/strings/authentication_ui.dart';
import 'package:flutter_fast_cli/src/strings/home_models.dart';
import 'package:flutter_fast_cli/src/strings/home_services.dart';
import 'package:flutter_fast_cli/src/strings/strings.dart';
import 'package:flutter_fast_cli/src/strings/user_service.dart';

Future<void> createHome(String appName) async {
  Directory homeServicesDirectory;
  Directory homeUiDirectory;
  Directory homeModelsDirectory;

  (homeModelsDirectory, homeUiDirectory, homeServicesDirectory) = createFeature('authentication');

  File messageFile = File('${homeModelsDirectory.path}/message.dart');
  await messageFile.writeAsString(getMessageText(appName), mode: FileMode.write);

  File responseStatusFile = File('${homeModelsDirectory.path}/response_status.dart');
  await responseStatusFile.writeAsString(getResponseStatusText(appName), mode: FileMode.write);

  File chatServiceFile = File('${homeServicesDirectory.path}/chat_service.dart');
  await chatServiceFile.writeAsString(getChatServiceText(appName), mode: FileMode.write);

  File fastChatServiceFile = File('${homeServicesDirectory.path}/fast_chat_service.dart');
  await fastChatServiceFile.writeAsString(getFastChatServiceText(appName), mode: FileMode.write);
}
