import 'package:cypres/model/user_model.dart';
import 'package:uuid/uuid.dart';

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
}