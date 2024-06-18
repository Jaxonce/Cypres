import 'package:cypres/data/DTOs/message_dto.dart';
import 'package:cypres/model/user_model.dart';

import '../../data/DTOs/conversation_dto.dart';

abstract class ConversationService {
  //Future<ConversationDTO> getConversation(String conversationId);

  Future<MessageDTO> getLastMessage(String contactId);

  Future<String> getConversationId(String contactId, String userId);
}
