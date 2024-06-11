import 'package:cypres/data/DTOs/contact_dto.dart';
import 'package:cypres/data/DTOs/conversation_dto.dart';
import 'package:cypres/data/DTOs/message_dto.dart';

import '../interfaces/message_service.dart';

class MessageServiceAPI implements MessageService {
  @override
  MessageDTO getLastMessage(ContactDTO c) {
    // TODO: implement getLastMessage
    throw UnimplementedError();
  }

  @override
  List<MessageDTO> getMessages(ConversationDTO c) {
    // TODO: implement getMessages
    throw UnimplementedError();
  }

  @override
  void sendMessage(MessageDTO m) {
    // TODO: implement sendMessage
  }
}
