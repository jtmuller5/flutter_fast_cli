import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutterfast/modules/chat/ui/chat/widgets/ai_chat.dart';
import 'chat_view_model.dart';

@RoutePage()
class ChatView extends StatelessWidget {
  const ChatView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChatViewModelBuilder(
      builder: (context, model) {
        return Scaffold(
          appBar: AppBar(title: const Text('Chat')),
          body: const AiChat(),
        );
      },
    );
  }
}
