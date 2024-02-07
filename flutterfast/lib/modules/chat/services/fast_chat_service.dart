import 'package:flutter/foundation.dart';
import 'package:flutterfast/modules/chat/models/fast_message.dart';

abstract class FastChatService {
  ValueNotifier<List<FastMessage>> messages = ValueNotifier([]);

  void setMessages(List<FastMessage> val) {
    messages.value = val;
  }

  Future<void> getMessages();

  Future<void> submitMessage(FastMessage message);
}
