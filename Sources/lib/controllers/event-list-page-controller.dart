import 'package:cypres/data/factories/event_factory.dart';
import 'package:cypres/data/factories/user-factory.dart';
import 'package:cypres/model/contact_model.dart';
import 'package:cypres/model/event_model.dart';
import 'package:cypres/model/user_model.dart';
import 'package:cypres/services/interfaces/user-service.dart';
import 'package:get_it/get_it.dart';
import 'package:uuid/uuid.dart';

import '../services/interfaces/contact_service.dart';
import '../services/interfaces/event_service.dart';

final GetIt _getIt = GetIt.instance;

class EventListPageController {
  final UserService _userService = _getIt.get<UserService>();
  final ContactService _contactService = _getIt.get<ContactService>();
  final EventService _eventService = _getIt.get<EventService>();

  UserModel connectUser() =>
      UserFactory.DTOToPOCO(_userService.connect("km1@gmail.com"));

  int getEventsNumber() =>
      _eventService.getEventsByCreator(connectUser().id).length;

  List<EventModel> getEvents(String userId, String contactId) =>
      EventFactory.DTOsToPOCOs(_eventService.getEvents(userId, contactId));

  EventModel getEventById(String id) =>
      EventFactory.DTOToPOCO(_eventService.getEventById(id));
}
