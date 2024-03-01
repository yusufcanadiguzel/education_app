import 'package:education_app/models/chat/chat.dart';

abstract class ChatRepository{
  Future<void> createChat(Chat chat);
}