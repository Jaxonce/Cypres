import 'package:cypres/services/stub/base_stub.dart';

import '../../data/DTOs/event_dto.dart';
import '../interfaces/event_service.dart';
import 'package:uuid/uuid.dart';

class EventServiceStub extends BaseStub implements EventService {
  @override
  List<EventDTO> getEventsByCreator(String creatorId) =>
      stub().events.where((e) => e.creator.id == creatorId).toList();

  @override
  void addEvent(EventDTO e) {
    e.id = Uuid().v4().toString();
    stub().events.add(e);
  }

  @override
  void editEvent(EventDTO oldEvent, EventDTO newEvent) {
    var index =
        stub().events.indexWhere((element) => element.id == oldEvent.id);
    stub().events[index] = newEvent;
  }

  @override
  List<EventDTO> getEvents(String userId, String contactId) {
    return stub().events;
  }

  @override
  EventDTO getLastEvent() {
    return stub().events.last;
  }

  @override
  EventDTO getEventById(String id) {
    return stub().events.firstWhere((element) => element.id == id);
  }

  @override
  Future<void> deleteEvent(String id) async {
    stub().events.removeWhere((element) => element.id == id);
  }
}
