import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterfast/modules/chat/services/fast_chat_service.dart';
import 'package:injectable/injectable.dart';
import 'package:flutterfast/app/services.dart';
import 'package:flutterfast/features/home/models/message.dart';

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
