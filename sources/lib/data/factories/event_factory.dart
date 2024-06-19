import 'package:cypres/data/DTOs/event_dto.dart';
import 'package:cypres/data/DTOs/user_dto.dart';
import 'package:cypres/model/event_model.dart';

import '../../model/user_model.dart';

class EventFactory {
  static EventModel DTOToPOCO(EventDTO DTO) {
    return EventModel(
      DTO.id,
      DTO.name,
      DTO.description,
      DTO.location,
      DTO.beginDate,
      DTO.endDate,
      UserModel.DTOToPOCO(DTO.creator),
      DTO.conversationId,
      DTO.sync,
    );
  }

  static List<EventModel> DTOsToPOCOs(List<EventDTO> DTOs) {
    List<EventModel> pocos = [];
    for (var e in DTOs) {
      pocos.add(DTOToPOCO(e));
    }
    return pocos;
  }

  static EventDTO POCOToDTO(EventModel POCO) {
    return EventDTO(POCO.id, POCO.name, POCO.description, POCO.location,
        POCO.beginDate, POCO.endDate, UserDTO.POCOToDTO(POCO.creator), POCO.conversationId, POCO.sync);
  }
}
