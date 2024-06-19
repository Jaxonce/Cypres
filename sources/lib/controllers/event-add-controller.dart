import 'package:cypres/data/factories/event_factory.dart';
import 'package:cypres/model/event_model.dart';
import 'package:cypres/services/interfaces/event_service.dart';
import 'package:cypres/services/interfaces/user-service.dart';
import 'package:get_it/get_it.dart';

import '../model/user_model.dart';
import '../services/interfaces/conversation_service.dart';

final GetIt _getIt = GetIt.instance;

class EventAddController {
  static EventAddController? _instance;

  final UserService _userService = _getIt.get<UserService>();
  final EventService _eventService = _getIt.get<EventService>();
  final ConversationService _conversationService = _getIt.get<ConversationService>();

  EventAddController._internal();

  factory EventAddController() {
    _instance ??= EventAddController._internal();
    return _instance!;
  }

  static EventAddController? getInstance() => _instance;

  static void resetInstance() {
    _instance = null;
  }

  // Future<UserModel> connectUser() async =>
  //     UserModel.DTOToPOCO(await _userService.connect("km1@gmail.com"));

  void addEvent(EventModel event) =>
      _eventService.addEvent(EventFactory.POCOToDTO(event));

  Future<String> getConversationId(String userId, String contactId) async =>
      await _conversationService.getConversationId(userId, contactId);

  void editEvent(EventModel oldEvent, EventModel newEvent) =>
      _eventService.editEvent(
          EventFactory.POCOToDTO(oldEvent), EventFactory.POCOToDTO(newEvent));
}
