import '../../data/DTOs/event_dto.dart';

abstract class EventService {
  void addEvent(EventDTO e);

  List<EventDTO> getEvents(String userId, String contactId);

  List<EventDTO> getEventsByCreator(String creatorId);

  EventDTO getLastEvent();

  EventDTO getEventById(String id);
}
