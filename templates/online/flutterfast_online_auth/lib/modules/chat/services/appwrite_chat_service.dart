import 'dart:developer';

import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:flutterfast_online_auth/app/get_it.dart';
import 'package:flutterfast_online_auth/modules/chat/models/fast_message.dart';
import 'package:flutterfast_online_auth/modules/chat/services/fast_chat_service.dart';
import 'package:injectable/injectable.dart';

@appwrite
@LazySingleton(as: FastChatService)
class AppwriteChatService extends FastChatService {
  final client = Client().setEndpoint('https://cloud.appwrite.io/v1').setProject(
        const String.fromEnvironment('APPWRITE_PROJECT_ID'),
      );

  Databases get databases => Databases(client);
  String get databaseId => const String.fromEnvironment('APPWRITE_DATABASE_ID');
  String get collectionId => 'messages';

  @override
  Future<void> getMessages() async {
    try {
      DocumentList messages = await databases.listDocuments(
        databaseId: databaseId,
        collectionId: collectionId,
        queries: [Query.orderDesc('created_at')],
      );

      if (messages.documents.isEmpty) setMessages([]);

      setMessages(messages.documents.map((e) => FastMessage.fromJson(e.data)).toList());
    } on AppwriteException catch (e) {
      log('Messages error: ' + e.message.toString());
      debugPrint(e.code.toString());
      debugPrint(e.type);
    } catch (e) {
      debugPrint('Appwrite error: $e');
    }
  }

  @override
  Future<void> submitMessage(FastMessage message) async {
    assert(message.senderId != null, 'User must be logged in to create message');

    message.createdAt = DateTime.now();

    try {
      String id = ID.unique();

      await databases.createDocument(
        documentId: id,
        databaseId: databaseId,
        collectionId: collectionId,
        data: message.toJson(),
      );
      messages.value = [message, ...messages.value];
    } catch (e) {
      debugPrint('Appwrite error: $e');
    }
  }
}
