import 'package:flutterfast/app/get_it.dart';
import 'package:flutterfast/modules/chat/models/fast_message.dart';
import 'package:flutterfast/modules/chat/services/fast_chat_service.dart';
import 'package:injectable/injectable.dart';

@appwrite
@LazySingleton(as: FastChatService)
class AppwriteChatService extends FastChatService {
  @override
  Future<void> getMessages() {
    // TODO: implement getMessages
    throw UnimplementedError();
  }

  @override
  Future<void> submitMessage(FastMessage message) async {
    // TODO: implement submitMessage
    throw UnimplementedError();
  }
}
