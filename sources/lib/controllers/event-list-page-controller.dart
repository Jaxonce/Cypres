import 'package:cypres/data/factories/event_factory.dart';
import 'package:cypres/model/event_model.dart';
import 'package:cypres/model/user_model.dart';
import 'package:cypres/services/interfaces/user-service.dart';
import 'package:get_it/get_it.dart';

import '../services/interfaces/event_service.dart';

final GetIt _getIt = GetIt.instance;

class EventListPageController {
  static EventListPageController? _instance;

  final UserService _userService = _getIt.get<UserService>();
  final EventService _eventService = _getIt.get<EventService>();

  EventListPageController._internal();

  factory EventListPageController() {
    _instance ??= EventListPageController._internal();
    return _instance!;
  }

  static EventListPageController? getInstance() => _instance;

  static void resetInstance() {
    _instance = null;
  }


  Future<UserModel> connectUser() async =>
      UserModel.DTOToPOCO(await _userService.connect("km1@gmail.com"));

  // int getEventsNumber() =>
  //     _eventService.getEventsByCreator(connectUser()..id).length;

  List<EventModel> getEvents(String userId, String contactId) =>
      EventFactory.DTOsToPOCOs(_eventService.getEvents(userId, contactId));

  EventModel getEventById(String id) =>
      EventFactory.DTOToPOCO(_eventService.getEventById(id));

  Future<void> deleteEvent(String id) async =>
      await _eventService.deleteEvent(id);

  void addEvent(EventModel event) =>
      _eventService.addEvent(EventFactory.POCOToDTO(event));

  void editEvent(EventModel oldEvent, EventModel newEvent) =>
      _eventService.editEvent(
          EventFactory.POCOToDTO(oldEvent), EventFactory.POCOToDTO(newEvent));
}
