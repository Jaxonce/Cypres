import 'package:cypres/data/DTOs/message_dto.dart';
import 'package:cypres/services/stub/base_stub.dart';

import '../../data/DTOs/conversation_dto.dart';
import '../interfaces/conversation_service.dart';

class ConversationServiceStub extends BaseStub implements ConversationService {
  // @override
  // Future<ConversationDTO> getConversation(String conversationId) async => stub()
  //     .conversations
  //     .firstWhere((element) => element.contactId == conversationId);

  @override
  Future<MessageDTO> getLastMessage(String contactId) {
    // TODO: implement getLastMessage
    throw UnimplementedError();
  }

  @override
  Future<String> getConversationId(String contactId, String userId) {
    // TODO: implement getConversationId
    throw UnimplementedError();
  }
}
