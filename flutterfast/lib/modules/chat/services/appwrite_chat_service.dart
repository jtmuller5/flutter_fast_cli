import 'package:appwrite/appwrite.dart';
import 'package:flutterfast/app/get_it.dart';
import 'package:flutterfast/modules/chat/models/fast_message.dart';
import 'package:flutterfast/modules/chat/services/fast_chat_service.dart';
import 'package:injectable/injectable.dart';

@appwrite
@LazySingleton(as: FastChatService)
class AppwriteChatService extends FastChatService {
  final client = Client().setEndpoint('https://cloud.appwrite.io/v1').setProject(const String.fromEnvironment('APPWRITE_PROJECT_ID'));

  Databases get databases => Databases(client);
  String get databaseId => String.fromEnvironment('APPWRITE_DATABASE_ID');

  @override
  Future<void> getMessages() async {
    databases.listDocuments(databaseId: databaseId, collectionId: 'messages');
  }

  @override
  Future<void> submitMessage(FastMessage message) async {
    // TODO: implement submitMessage
    throw UnimplementedError();
  }
}
