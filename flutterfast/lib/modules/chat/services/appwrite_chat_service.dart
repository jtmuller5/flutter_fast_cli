import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:flutterfast/app/get_it.dart';
import 'package:flutterfast/modules/chat/models/fast_message.dart';
import 'package:flutterfast/modules/chat/services/fast_chat_service.dart';
import 'package:injectable/injectable.dart';

@appwrite
@LazySingleton(as: FastChatService)
class AppwriteChatService extends FastChatService {
  final client = Client().setEndpoint('https://cloud.appwrite.io/v1').setProject(
        const String.fromEnvironment('APPWRITE_PROJECT_ID'),
      );

  Databases get databases => Databases(client);
  String get databaseId => String.fromEnvironment('APPWRITE_DATABASE_ID');

  @override
  Future<void> getMessages() async {
    debugPrint(databases.client.endPoint);
    try {
      DocumentList messages = await databases.listDocuments(
        databaseId: databaseId,
        collectionId: 'messages',
      );

      if (messages.documents.isEmpty) setMessages([]);

      setMessages(messages.documents.map((e) => FastMessage.fromJson(e.data)).toList());
    } on AppwriteException catch (e) {
      debugPrint('Messages error: ' + e.message.toString());
      debugPrint(e.code.toString());
      debugPrint(e.type);
    } catch (e) {
      debugPrint('Appwrite error: $e');
    }
  }

  @override
  Future<void> submitMessage(FastMessage message) async {
    try {
      String id = ID.unique();

      await databases.createDocument(
        documentId: id,
        databaseId: databaseId,
        collectionId: 'messages',
        data: message.toJson(),
      );
      messages.value = [...messages.value, message];
    } catch (e) {
      debugPrint('Appwrite error: $e');
    }
  }
}
