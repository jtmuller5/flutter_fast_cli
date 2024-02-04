import 'package:flutter/foundation.dart';
import 'package:flutterfast/features/home/models/message.dart';
import 'package:flutterfast/modules/chat/models/fast_message.dart';

abstract class FastChatService {
  ValueNotifier<List<Message>> messages = ValueNotifier([]);

  void setMessages(List<Message> val) {
    messages.value = val;
  }

  Future<void> getMessages();

  Future<void> submitMessage(FastMessage message);
}
