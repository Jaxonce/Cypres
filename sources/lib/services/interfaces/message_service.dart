import '../../data/DTOs/message_dto.dart';

abstract class MessageService {
  void sendMessage(MessageDTO m);
}
