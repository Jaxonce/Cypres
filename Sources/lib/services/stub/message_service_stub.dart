import 'package:cypres/services/interfaces/message_service.dart';

import '../../data/DTOs/contact_dto.dart';
import '../../data/DTOs/message_dto.dart';
import 'base_stub.dart';

class MessageServiceStub extends BaseStub implements MessageService {
  @override
  void sendMessage(MessageDTO m) {
    // TODO: implement sendMessage
  }

  @override
  List<MessageDTO> getMessages(ContactDTO c) => stub()
      .messages
      .where((m) => m.senderId == c.id || m.receiverId == c.id)
      .toList();
}
