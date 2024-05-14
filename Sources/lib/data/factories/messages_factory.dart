import 'package:test_flutter_vue/model/message_model.dart';

import '../DTOs/message_dto.dart';

class MessagesFactory {
  static MessageModel DTOToPOCO(MessageDTO DTO) =>
      MessageModel(DTO.content, DTO.date, DTO.senderId, DTO.receiverId);

  static List<MessageModel> DTOsToPOCOs(List<MessageDTO> DTOs) {
    List<MessageModel> pocos = [];
    for (var e in DTOs) {
      pocos.add(DTOToPOCO(e));
    }

    return pocos;
  }
}
