String getChatServiceText(String appName) {
  appName = appName.toLowerCase();
  return '''
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:$appName/app/services.dart';
import 'package:$appName/features/home/models/message.dart';
import 'package:$appName/features/home/services/fast_chat_service.dart';

@LazySingleton(as: FastChatService)
class ChatService extends FastChatService {
  @override
  Future<void> submitMessage(String message) async {
    DocumentReference<Map<String, dynamic>> messageRef = FirebaseFirestore.instance.collection('users').doc(authenticationService.id).collection('messages').doc();

    messages.value = List.from(messages.value
      ..insert(
          0,
          Message(
            id: messageRef.id,
            message: message,
            createdAt: DateTime.now(),
          )));

    await messageRef.set({
      'id': messageRef.id,
      'message': message,
      'timestamp': DateTime.now().millisecondsSinceEpoch,
    });

    messageRef.snapshots().listen((event) {
      messages.value = List.from(messages.value..replaceRange(0, 1, [Message.fromJson(event.data()!)]));
    });
  }

  @override
  Future<void> getMessages() async {
    QuerySnapshot<Map<String, dynamic>> snap =
        await FirebaseFirestore.instance.collection('users').doc(authenticationService.id).collection('messages').orderBy('createdAt', descending: true).limit(20).get();

    messages.value = snap.docs.map((e) => Message.fromJson(e.data())).toList();
  }
}
''';
}

String getFastChatServiceText(String appName) {
  appName = appName.toLowerCase();
  return '''
import 'package:flutter/foundation.dart';
import 'package:$appName/features/home/models/message.dart';

abstract class FastChatService {
  ValueNotifier<List<Message>> messages = ValueNotifier([]);

  void setMessages(List<Message> val) {
    messages.value = val;
  }

  Future<void> getMessages();

  Future<void> submitMessage(String message);
}
''';
}