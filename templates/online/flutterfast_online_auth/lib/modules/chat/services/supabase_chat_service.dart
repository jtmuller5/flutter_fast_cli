import 'package:flutter/material.dart';
import 'package:flutterfast_online_auth/app/get_it.dart';
import 'package:flutterfast_online_auth/modules/chat/models/fast_message.dart';
import 'package:flutterfast_online_auth/modules/chat/services/fast_chat_service.dart';
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
