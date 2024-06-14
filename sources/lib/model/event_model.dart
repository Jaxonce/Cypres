import 'package:cypres/model/user_model.dart';

import '../data/DTOs/event_dto.dart';

class EventModel {
  final String id;
  final String name;
  final String description;
  final String location;
  final DateTime beginDate;
  final DateTime endDate;
  final UserModel creator;
  final bool sync;

  EventModel(this.id, this.name,this.description,this.location,this.beginDate,this.endDate, this.creator,[this.sync = false]);

  factory EventModel.DTOToPOCO(EventDTO DTO) {
    return EventModel(
      DTO.id,
      DTO.name,
      DTO.description,
      DTO.location,
      DTO.beginDate,
      DTO.endDate,
      UserModel.DTOToPOCO(DTO.creator),
      DTO.sync,
    );
  }
}