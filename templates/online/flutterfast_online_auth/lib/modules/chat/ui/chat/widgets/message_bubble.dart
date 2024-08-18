import 'package:flutter/material.dart';
import 'package:flutterfast_online_auth/app/constants.dart';
import 'package:flutterfast_online_auth/app/text_theme.dart';
import 'package:flutterfast_online_auth/modules/chat/models/fast_message.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble({super.key, required this.message});

  final FastMessage message;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircleAvatar(
                child: Icon(Icons.person),
              ),
              gap8,
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text('Sender', style: context.bodyLarge.bold),
                        gap4,
                        Text('•', style: context.bodySmall),
                        gap4,
                        Text(
                          timeAgo(message.createdAt ?? DateTime.now()), // Assuming message.timestamp is a DateTime object
                          style: context.bodySmall,
                        ),
                      ],
                    ),
                    Text(message.message ?? '', style: context.bodyLarge),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// Helper function to calculate the time ago in a fuzzy manner
String timeAgo(DateTime dateTime) {
  final Duration diff = DateTime.now().difference(dateTime);
  if (diff.inDays > 1) {
    return '${diff.inDays} days ago';
  } else if (diff.inHours > 1) {
    return '${diff.inHours} hours ago';
  } else if (diff.inMinutes > 1) {
    return '${diff.inMinutes} minutes ago';
  } else {
    return 'just now';
  }
}
