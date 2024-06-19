import 'package:cypres/data/DTOs/user_dto.dart';

import '../../model/event_model.dart';

class EventDTO {
  String id;
  String name;
  String description;
  String location;
  DateTime beginDate;
  DateTime endDate;
  UserDTO creator;
  String conversationId;
  bool sync;

  EventDTO(this.id, this.name, this.description, this.location, this.beginDate,
      this.endDate, this.creator, this.conversationId,
      [this.sync = false]);

  factory EventDTO.POCOToDTO(EventModel POCO) {
    return EventDTO(POCO.id, POCO.name, POCO.description, POCO.location,
        POCO.beginDate, POCO.endDate, UserDTO.POCOToDTO(POCO.creator), POCO.conversationId);}
}
