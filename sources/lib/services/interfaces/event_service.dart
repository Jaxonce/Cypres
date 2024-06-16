import '../../data/DTOs/event_dto.dart';

abstract class EventService {
  void addEvent(EventDTO e);

  void editEvent(EventDTO oldEvent, EventDTO newEvent);

  List<EventDTO> getEvents(String userId, String contactId);

  List<EventDTO> getEventsByCreator(String creatorId);

  EventDTO getLastEvent();

  EventDTO getEventById(String id);

  Future<void> deleteEvent(String id);
}
