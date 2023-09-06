import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:template/app/services.dart';
import 'package:template/features/home/models/message.dart';
import 'package:template/features/home/services/fast_chat_service.dart';

@LazySingleton(as: FastChatService)
class ChatService extends FastChatService {
  @override
  Future<void> submitMessage(String message) async {

    DocumentReference messageRef = FirebaseFirestore.instance.collection('users').doc(authenticationService.id).collection('messages').doc();
    await messageRef.set({
      'id': messageRef.id,
      'message': message,
      'timestamp': DateTime.now().millisecondsSinceEpoch,
    });
  }

  @override
  Stream<List<Message>> messageStream() {
    return FirebaseFirestore.instance.collection('users').doc(authenticationService.id).collection('messages').orderBy('createdAt', descending: true).limit(20).snapshots().map((event) {
      return event.docs.map((e) {
        return Message.fromJson(e.data());
      }).toList();
    });
  }
}
