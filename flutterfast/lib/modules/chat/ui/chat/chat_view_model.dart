import 'package:code_on_the_rocks/code_on_the_rocks.dart';
import 'package:flutter/material.dart';
import 'package:flutterfast/app/services.dart';

class ChatViewModelBuilder extends ViewModelBuilder<ChatViewModel> {
  const ChatViewModelBuilder({
    super.key,
    required super.builder,
  });

  @override
  State<StatefulWidget> createState() => ChatViewModel();
}

class ChatViewModel extends ViewModel<ChatViewModel> {
  TextEditingController messageController = TextEditingController();

  Future<void> submitMessage() async {
    await chatService.submitMessage(messageController.text);
  }

  @override
  void initState() {
    setLoading(true);
    chatService.getMessages().then((value) {
      setLoading(false);
    });
    super.initState();
  }

  static ChatViewModel of_(BuildContext context) =>
      getModel<ChatViewModel>(context);
}
