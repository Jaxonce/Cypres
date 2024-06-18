import 'package:cypres/data/DTOs/conversation_dto.dart';

import '../../data/DTOs/contact_dto.dart';
import '../../data/DTOs/message_dto.dart';

abstract class MessageService {
  void sendMessage(MessageDTO m);

  Future<List<MessageDTO>> getMessages(String conversationId);

  MessageDTO getLastMessage(ContactDTO c);
}
