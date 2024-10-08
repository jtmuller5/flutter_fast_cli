import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutterfast_online_auth/modules/chat/ui/chat/chat_view_model.dart';
import 'package:flutterfast_online_auth/modules/chat/ui/chat/widgets/chat_feed.dart';

@RoutePage()
class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChatViewModelBuilder(
      builder: (context, model) {
        return const Scaffold(
          body: ChatFeed(),
        );
      },
    );
  }
}
