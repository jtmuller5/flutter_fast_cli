import 'package:flutterfast/app/get_it.dart';
import 'package:flutterfast/modules/chat/models/fast_message.dart';
import 'package:flutterfast/modules/chat/services/fast_chat_service.dart';
import 'package:injectable/injectable.dart';

@pocketbase
@LazySingleton(as: FastChatService)
class PocketbaseChatService extends FastChatService {
  @override
  Future<void> getMessages() {
    // TODO: implement getMessages
    throw UnimplementedError();
  }

  @override
  Future<void> submitMessage(FastMessage message) {
    // TODO: implement submitMessage
    throw UnimplementedError();
  }
}
