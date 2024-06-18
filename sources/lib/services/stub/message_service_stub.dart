import 'package:cypres/services/interfaces/message_service.dart';

import '../../data/DTOs/contact_dto.dart';
import '../../data/DTOs/message_dto.dart';
import 'base_stub.dart';

class MessageServiceStub extends BaseStub implements MessageService {
  @override
  Future<List<MessageDTO>> getMessages(String c) async =>
      await stub().messages.where((m) => m.senderId == c).toList();

  @override
  MessageDTO getLastMessage(ContactDTO c) => stub()
      .messages
      .where((m) => m.senderId == c.id)
      .reduce((a, b) => a.date.difference(DateTime.now()).abs() <
              b.date.difference(DateTime.now()).abs()
          ? a
          : b);

  @override
  Future<void> sendMessage(MessageDTO m, String convId) {
    // TODO: implement sendMessage
    throw UnimplementedError();
  }
}
