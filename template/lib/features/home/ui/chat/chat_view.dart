import 'package:flutter/material.dart';
import 'package:template/features/home/ui/chat/widgets/ai_chat.dart';
import 'chat_view_model.dart';

class ChatView extends StatelessWidget {
  const ChatView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChatViewModelBuilder(
      builder: (context, model) {
        return AiChat();
      },
    );
  }
}
