import 'package:cypres/data/DTOs/user_dto.dart';
import 'package:uuid/uuid.dart';

class EventDTO {
  String id;
  String name;
  String description;
  String location;
  DateTime beginDate;
  DateTime endDate;
  UserDTO creator;
  bool sync;

  EventDTO(this.id, this.name, this.description, this.location, this.beginDate,
      this.endDate, this.creator,
      [this.sync = false]);
}
