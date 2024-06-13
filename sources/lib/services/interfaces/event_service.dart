import '../../data/DTOs/event_dto.dart';

abstract class EventService {
  void addEvent(EventDTO e);

  List<EventDTO> getEvents();

  List<EventDTO> getEventsByCreator(String creatorId);

  EventDTO getLastEvent();
}
