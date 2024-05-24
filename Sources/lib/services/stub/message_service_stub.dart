import 'package:cypres/services/interfaces/message_service.dart';

import '../../data/DTOs/contact_dto.dart';
import '../../data/DTOs/message_dto.dart';
import 'base_stub.dart';

class MessageServiceStub extends BaseStub implements MessageService {
  @override
  void sendMessage(MessageDTO m) {
    stub().messages.add(m);
  }

  @override
  List<MessageDTO> getMessages(ContactDTO c) => stub()
      .messages
      .where((m) => m.senderId == c.id || m.receiverId == c.id)
      .toList();

  @override
  MessageDTO getLastMessage(ContactDTO c) => stub()
      .messages
      .where((m) => m.senderId == c.id || m.receiverId == c.id)
      .reduce((a, b) => a.date.difference(DateTime.now()).abs() <
              b.date.difference(DateTime.now()).abs()
          ? a
          : b);
}
