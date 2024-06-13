import 'package:cypres/services/stub/base_stub.dart';

import '../../data/DTOs/event_dto.dart';
import '../interfaces/event_service.dart';

class EventServiceStub extends BaseStub implements EventService {
  @override
  List<EventDTO> getEventsByCreator(String creatorId) => stub()
      .events
      .where((e) => e.creator.id == creatorId)
      .toList();

  @override
  void addEvent(EventDTO e) {
    stub().events.add(e);
  }

  @override
  List<EventDTO> getEvents() {
    return stub().events;
  }

  @override
  EventDTO getLastEvent() {
    return stub().events.last;
  }
}