import 'package:code_on_the_rocks/code_on_the_rocks.dart';
import 'package:flutter/material.dart';
import 'package:template/app/services.dart';
import 'package:template/features/home/models/message.dart';
import 'package:template/features/home/ui/chat/chat_view_model.dart';
import 'package:template/features/home/ui/chat/widgets/message_bubble.dart';

class AiChat extends StatelessWidget {
  const AiChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ChatViewModel model = getModel<ChatViewModel>(context);

    return ValueListenableBuilder(
        valueListenable: chatService.messages,
        builder: (context, messages, child) {
          return AnimatedSwitcher(
            duration: kThemeAnimationDuration,
            child: model.isLoading
                ? const Center(child: CircularProgressIndicator())
                : Stack(
                    children: [
                      messages.isEmpty
                          ? const Center(child: Text('No messages'))
                          : Column(
                              children: [
                                Expanded(
                                  child: ListView.builder(
                                    reverse: true,
                                    itemCount: messages.length,
                                    itemBuilder: (context, index) {
                                      Message message = messages[index];

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
                              hintText: 'Ask a question',
                              fillColor: Theme.of(context).colorScheme.background,
                              filled: true,
                              suffixIcon: Material(
                                color: Colors.transparent,
                                child: IconButton(
                                  icon: const Icon(Icons.send),
                                  onPressed: () async {
                                    await model.submitMessage();
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
