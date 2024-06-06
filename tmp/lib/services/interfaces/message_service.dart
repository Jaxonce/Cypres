import '../../data/DTOs/contact_dto.dart';
import '../../data/DTOs/message_dto.dart';

abstract class MessageService {
  void sendMessage(MessageDTO m);

  List<MessageDTO> getMessages(ContactDTO c);

  MessageDTO getLastMessage(ContactDTO c);
}
