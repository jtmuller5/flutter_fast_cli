import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:{{ name }}/modules/chat/ui/chat/chat_view_model.dart';
import 'package:{{ name }}/modules/chat/ui/chat/widgets/chat_feed.dart';

@RoutePage()
class ChatView extends StatelessWidget {
  const ChatView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChatViewModelBuilder(
      builder: (context, model) {
        return Scaffold(
          body: ChatFeed(),
        );
      },
    );
  }
}
