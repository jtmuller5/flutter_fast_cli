import 'dart:io';

import 'package:flutter_fast_cli/src/commands/create_app/features/utils.dart';
import 'package:flutter_fast_cli/src/commands/strings.dart';

Future<void> createHome(String appName) async {
  Directory homeServicesDirectory;
  Directory homeUiDirectory;
  Directory homeModelsDirectory;

  (homeModelsDirectory, homeServicesDirectory, homeUiDirectory) = await createFeature('home');

  await Directory('features/home/ui/chat/widgets').create(recursive: true);
  await Directory('features/home/ui/home/widgets').create(recursive: true);
  await Directory('features/home/ui/onboarding/widgets').create(recursive: true);

  File messageFile = File('${homeModelsDirectory.path}/message.dart');
  await messageFile.writeAsString(getMessageText(appName), mode: FileMode.write);

  File responseStatusFile = File('${homeModelsDirectory.path}/response_status.dart');
  await responseStatusFile.writeAsString(getResponseStatusText(appName), mode: FileMode.write);

  File chatServiceFile = File('${homeServicesDirectory.path}/chat_service.dart');
  await chatServiceFile.writeAsString(getChatServiceText(appName), mode: FileMode.write);

  File fastChatServiceFile = File('${homeServicesDirectory.path}/fast_chat_service.dart');
  await fastChatServiceFile.writeAsString(getFastChatServiceText(appName), mode: FileMode.write);

  File homeViewFile = File('${homeUiDirectory.path}/home/home_view.dart');
  await homeViewFile.writeAsString(getHomeViewText(appName), mode: FileMode.write);

  File homeViewModelFile = File('${homeUiDirectory.path}/home/home_view_model.dart');
  await homeViewModelFile.writeAsString(getHomeViewModelText(), mode: FileMode.write);

  File drawerFile = File('${homeUiDirectory.path}/home/widgets/drawer.dart');
  await drawerFile.writeAsString(getDrawerText(appName), mode: FileMode.write);

  File chatViewFile = File('${homeUiDirectory.path}/chat/chat_view.dart');
  await chatViewFile.writeAsString(getChatViewText(appName), mode: FileMode.write);

  File chatViewModelFile = File('${homeUiDirectory.path}/chat/chat_view_model.dart');
  await chatViewModelFile.writeAsString(getChatViewModelText(appName), mode: FileMode.write);

  File aiChatFile = File('${homeUiDirectory.path}/chat/widgets/ai_chat.dart');
  await aiChatFile.writeAsString(getAiChat(appName), mode: FileMode.write);

  File messageBubbleFile = File('${homeUiDirectory.path}/chat/widgets/message_bubble.dart');
  await messageBubbleFile.writeAsString(getMessageBubble(appName), mode: FileMode.write);

  File onboardingViewFile = File('${homeUiDirectory.path}/onboarding/onboarding_view.dart');
  await onboardingViewFile.writeAsString(getOnboardingViewText(appName), mode: FileMode.write);

  File onboardingViewModelFile = File('${homeUiDirectory.path}/onboarding/onboarding_view_model.dart');
  await onboardingViewModelFile.writeAsString(getOnboardingViewModelText(), mode: FileMode.write);

  File pageOneFile = File('${homeUiDirectory.path}/onboarding/widgets/page_one.dart');
  await pageOneFile.writeAsString(getPageOneText(), mode: FileMode.write);

  File pageTwoFile = File('${homeUiDirectory.path}/onboarding/widgets/page_two.dart');
  await pageTwoFile.writeAsString(getPageTwoText(), mode: FileMode.write);

  File pageThreeFile = File('${homeUiDirectory.path}/onboarding/widgets/page_three.dart');
  await pageThreeFile.writeAsString(getPageThreeText(), mode: FileMode.write);
}
