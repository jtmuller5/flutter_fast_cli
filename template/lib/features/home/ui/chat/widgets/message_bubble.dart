import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:template/app/text_theme.dart';
import 'package:template/features/home/models/message.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble({Key? key, required this.message}) : super(key: key);

  final Message message;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.8),
                child: DecoratedBox(
                  decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: const BorderRadius.all(Radius.circular(8))),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(child: Text(message.message, style: context.bodyLarge)),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        if (message.response != null)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.8,),
                  child: DecoratedBox(
                    decoration: BoxDecoration(color: Colors.lightGreen.shade200, borderRadius: const BorderRadius.all(Radius.circular(8))),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Flexible(child: Text(message.response!, style: context.bodyLarge)),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        else
          const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: SizedBox.square(
                dimension: 24,
                child: CircularProgressIndicator(),
              ),
            ),
          ),
      ],
    );
  }
}
