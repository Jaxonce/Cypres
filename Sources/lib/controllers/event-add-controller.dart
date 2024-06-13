import 'package:cypres/data/factories/event_factory.dart';
import 'package:cypres/model/event_model.dart';
import 'package:cypres/services/interfaces/event_service.dart';
import 'package:cypres/services/interfaces/user-service.dart';
import 'package:get_it/get_it.dart';

import '../data/factories/user-factory.dart';
import '../model/user_model.dart';

final GetIt _getIt = GetIt.instance;

class EventAddController {
  final UserService _userService = _getIt.get<UserService>();
  final EventService _eventService = _getIt.get<EventService>();

  UserModel connectUser() =>
      UserFactory.DTOToPOCO(_userService.connect("km1@gmail.com"));

  void addEvent(EventModel event) =>
      _eventService.addEvent(EventFactory.POCOToDTO(event));

  void editEvent(EventModel oldEvent, EventModel newEvent) =>
      _eventService.editEvent(
          EventFactory.POCOToDTO(oldEvent), EventFactory.POCOToDTO(newEvent));
}
