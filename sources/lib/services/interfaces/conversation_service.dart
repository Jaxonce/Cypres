import 'package:cypres/data/DTOs/message_dto.dart';

import '../../data/DTOs/conversation_dto.dart';

abstract class ConversationService {
  Future<ConversationDTO> getConversation(String contactId);

  Future<MessageDTO> getLastMessage(String contactId);
}
