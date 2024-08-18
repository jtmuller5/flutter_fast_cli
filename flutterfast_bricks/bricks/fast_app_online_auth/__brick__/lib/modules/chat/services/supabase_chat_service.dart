import 'package:flutter/material.dart';
import 'package:{{ name }}/app/get_it.dart';
import 'package:{{ name }}/modules/chat/models/fast_message.dart';
import 'package:{{ name }}/modules/chat/services/fast_chat_service.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@supabase
@LazySingleton(as: FastChatService)
class SupabaseChatService extends FastChatService {
  SupabaseClient get _supabase => Supabase.instance.client;

  @override
  Future<void> getMessages() async {
    _supabase.from('messages').select().limit(50);
  }

  @override
  Future<void> submitMessage(FastMessage message) async {
    try {
      await _supabase.from('messages').insert(message.toJson());
      messages.value = [...messages.value, message];
    } catch (error) {
      debugPrint(error.toString());
    }
  }
}
