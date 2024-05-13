import 'package:test_flutter_vue/model/conversation_model.dart';

import '../DTOs/conversation_dto.dart';

class ConversationsFactory {
  static ConversationModel DTOToPOCO(ConversationDTO DTO) {
    // TODO: implement DTOToPOCO
    throw UnimplementedError();
  }

  static List<ConversationModel> DTOsToPOCOs(List<ConversationDTO> DTOs) {
    List<ConversationModel> pocos = [];
    for (var e in DTOs) {
      pocos.add(DTOToPOCO(e));
    }

    return pocos;
  }
}
