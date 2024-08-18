import 'package:flutter/material.dart';
import 'package:{{ name }}/app/get_it.dart';
import 'package:{{ name }}/features/authentication/services/authentication_service/pocketbase_authentication_service.dart';
import 'package:{{ name }}/modules/chat/models/fast_message.dart';
import 'package:{{ name }}/modules/chat/services/fast_chat_service.dart';
import 'package:injectable/injectable.dart';

@pocketbase
@LazySingleton(as: FastChatService)
class PocketbaseChatService extends FastChatService {
  @override
  Future<void> getMessages() async {
    final messagesResponse = await pb.collection('messages').getList();

    final messages = messagesResponse.items.map((e) => FastMessage.fromJson(e.data)).toList();
    setMessages(messages);
  }

  @override
  Future<void> submitMessage(FastMessage message) async {
    try {
      await pb.collection('messages').create(body: message.toJson());
      setMessages([
        message,
        ...messages.value,
      ]);
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
