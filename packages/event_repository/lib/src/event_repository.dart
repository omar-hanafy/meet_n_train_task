import '../event_repository.dart';

abstract class EventRepository {
  Future<List<EventModel>> getScheduledEvents(
      {required int pageNumber, required DateTime currentDate});
}
