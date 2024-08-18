import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:{{ name }}/app/get_it.dart';
import 'package:{{ name }}/modules/chat/models/fast_message.dart';
import 'package:{{ name }}/modules/chat/services/fast_chat_service.dart';
import 'package:injectable/injectable.dart';

@firebase
@LazySingleton(as: FastChatService)
class FirebaseChatService extends FastChatService {
  @override
  Future<void> submitMessage(FastMessage message) async {
    try {
      await FirebaseFirestore.instance.collection('messages').add(message.toJson());
      setMessages([
        message,
        ...messages.value,
      ]);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Future<void> getMessages() async {
    try {
      final snapshot = await FirebaseFirestore.instance.collection('messages').orderBy('created_at', descending: true).get();
      debugPrint('snapshot: $snapshot');
      final messages = snapshot.docs.map((e) => FastMessage.fromJson(e.data())).toList();
      setMessages(messages);
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
