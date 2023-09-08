import 'package:flutter/foundation.dart';
import 'package:flutterfast/features/home/models/message.dart';

abstract class FastChatService {
  ValueNotifier<List<Message>> messages = ValueNotifier([]);

  void setMessages(List<Message> val) {
    messages.value = val;
  }

  Future<void> getMessages();

  Future<void> submitMessage(String message);
}
