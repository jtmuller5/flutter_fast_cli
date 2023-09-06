import 'package:code_on_the_rocks/code_on_the_rocks.dart';
import 'package:flutter/material.dart';
import 'package:template/app/services.dart';
import 'package:template/features/home/models/message.dart';
import 'package:template/features/home/ui/home/home_view_model.dart';
import 'package:template/features/home/ui/home/widgets/message_bubble.dart';

class AiChat extends StatelessWidget {
  const AiChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeViewModel model = getModel<HomeViewModel>(context);

    return StreamBuilder<List<Message>>(
        stream: chatService.messageStream(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return Stack(
            children: [
              snapshot.data == null
                  ? const Center(
                      child: Text('No messages'),
                    )
                  : ListView.builder(
                      reverse: true,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        Message message = snapshot.data![index];

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            MessageBubble(message: message),
                            if (index == 0) const SizedBox(height: 80),
                          ],
                        );
                      },
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
          );
        });
  }
}
