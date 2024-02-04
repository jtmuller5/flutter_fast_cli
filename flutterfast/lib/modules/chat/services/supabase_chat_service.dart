import 'package:flutterfast/app/get_it.dart';
import 'package:flutterfast/modules/chat/models/fast_message.dart';
import 'package:flutterfast/modules/chat/services/fast_chat_service.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@supabase
@LazySingleton(as: FastChatService)
class SupabaseChatService extends FastChatService {
  SupabaseClient get _supabase => Supabase.instance.client;

  @override
  Future<void> getMessages() {
    // TODO: implement getMessages
    throw UnimplementedError();
  }

  @override
  Future<void> submitMessage(FastMessage message) async {
    _supabase.from('messages').upsert({
      'message': message,
    });
  }
}
