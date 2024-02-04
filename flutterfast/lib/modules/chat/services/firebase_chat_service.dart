import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterfast/app/get_it.dart';
import 'package:flutterfast/modules/chat/models/fast_message.dart';
import 'package:flutterfast/modules/chat/services/fast_chat_service.dart';
import 'package:injectable/injectable.dart';

@firebase
@LazySingleton(as: FastChatService)
class FirebaseChatService extends FastChatService {
  @override
  Future<void> submitMessage(FastMessage message) async {
    
  }

  @override
  Future<void> getMessages() async {
    
  }
}
