import 'package:cypres/data/DTOs/event_dto.dart';
import 'package:cypres/data/factories/user-factory.dart';
import 'package:cypres/model/event_model.dart';

class EventFactory {
  static EventModel DTOToPOCO(EventDTO DTO) {
    return EventModel(
      DTO.id,
      DTO.name,
      DTO.description,
      DTO.location,
      DTO.beginDate,
      DTO.endDate,
      UserFactory.DTOToPOCO(DTO.creator),
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
}