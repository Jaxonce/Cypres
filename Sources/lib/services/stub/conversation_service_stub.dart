import 'package:cypres/data/DTOs/message_dto.dart';
import 'package:cypres/services/stub/base_stub.dart';

import '../../data/DTOs/conversation_dto.dart';
import '../interfaces/conversation_service.dart';

class ConversationServiceStub extends BaseStub implements ConversationService {
  @override
  Future<ConversationDTO> getConversation(String contactId) async => stub()
      .conversations
      .firstWhere((element) => element.contactId == contactId);

  @override
  Future<MessageDTO> getLastMessage(String contactId) {
    // TODO: implement getLastMessage
    throw UnimplementedError();
  }
}
