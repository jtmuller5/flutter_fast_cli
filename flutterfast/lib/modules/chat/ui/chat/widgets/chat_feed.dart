import 'package:flutter/material.dart';
import 'package:flutterfast/app/services.dart';
import 'package:flutterfast/modules/chat/models/fast_message.dart';
import 'package:flutterfast/modules/chat/ui/chat/chat_view_model.dart';
import 'package:flutterfast/modules/chat/ui/chat/widgets/message_bubble.dart';
import 'package:simple_mvvm/simple_mvvm.dart';

class ChatFeed extends StatelessWidget {
  const ChatFeed({super.key});

  @override
  Widget build(BuildContext context) {
    ChatViewModel model = getModel<ChatViewModel>(context);
    return ValueListenableBuilder(
        valueListenable: chatService.messages,
        builder: (context, messages, child) {
          return AnimatedSwitcher(
            duration: kThemeAnimationDuration,
            child: model.loading.value
                ? const Center(child: CircularProgressIndicator())
                : Stack(
                    children: [
                      messages.isEmpty
                          ? const Center(child: Text('No posts'))
                          : Column(
                              children: [
                                Expanded(
                                  child: ListView.builder(
                                    reverse: true,
                                    itemCount: messages.length,
                                    itemBuilder: (context, index) {
                                      FastMessage message = messages[index];

                                      return Column(
                                        key: ValueKey(message.id),
                                        crossAxisAlignment: CrossAxisAlignment.stretch,
                                        children: [
                                          MessageBubble(message: message),
                                          if (index == 0) const SizedBox(height: 80),
                                        ],
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: model.messageController,
                            decoration: InputDecoration(
                              hintText: 'What\'s on your mind?',
                              fillColor: Theme.of(context).colorScheme.background,
                              filled: true,
                              suffixIcon: Material(
                                color: Colors.transparent,
                                child: IconButton(
                                  icon: const Icon(Icons.send),
                                  onPressed: () async {
                                    await chatService.submitMessage(FastMessage(
                                      message: model.messageController.text,
                                      senderId: authenticationService.id,
                                    ));
                                    model.messageController.clear();
                                  },
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
          );
        });
  }
}
