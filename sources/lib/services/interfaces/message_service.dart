import '../../data/DTOs/message_dto.dart';

abstract class MessageService {
  Future<void> sendMessage(MessageDTO m, String convId);
}
