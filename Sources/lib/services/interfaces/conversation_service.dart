import '../../data/DTOs/conversation_dto.dart';

abstract class ConversationService {
  List<ConversationDTO> getConversations();
}
