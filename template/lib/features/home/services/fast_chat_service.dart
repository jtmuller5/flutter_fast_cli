import 'package:template/features/home/models/message.dart';

abstract class FastChatService {
  Future<void> submitMessage(String message);

  Stream<List<Message>> messageStream();
}