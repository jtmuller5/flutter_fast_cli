import 'package:flutter/material.dart';
import 'package:flutterfast_online_auth/app/constants.dart';
import 'package:flutterfast_online_auth/app/text_theme.dart';
import 'package:flutterfast_online_auth/modules/chat/models/fast_message.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble({Key? key, required this.message}) : super(key: key);

  final FastMessage message;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                child: Icon(Icons.person),
              ),
              gap8,
              Flexible(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Sender', style: context.bodyLarge.bold),
                  Text(message.message ?? '', style: context.bodyLarge),
                ],
              )),
            ],
          ),
        ),
      ],
    );
  }
}
