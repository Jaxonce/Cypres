import 'package:cypres/data/DTOs/user_dto.dart';
import 'package:uuid/uuid.dart';

class EventDTO {
  final String id;
  final String name;
  final String description;
  final String location;
  final DateTime beginDate;
  final DateTime endDate;
  final UserDTO creator;
  final bool sync;

  EventDTO(this.id, this.name,this.description,this.location,this.beginDate,this.endDate, this.creator,[this.sync = false]);
}