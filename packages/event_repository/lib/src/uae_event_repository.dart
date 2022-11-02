import 'package:uae_api_client/server_api_client.dart';

import '../event_repository.dart';

class UaeEventRepository extends EventRepository {
  UaeEventRepository({
    required String userId,
  }) : _userId = userId;

  final ServerApiClient _serverApiClient = UaeServer();
  final String _userId;

  // profile/events/upcoming/${userId}/ ?page=${pageNumber}&date_gte=${currentDate}
  @override
  Future<List<EventModel>> getScheduledEvents(
      {required int pageNumber, required DateTime currentDate}) async {
    return EventsModel.fromJson(
      await _serverApiClient.getResponse(
        path: "/v1/profile/events/upcoming/$_userId/",
        params: {"page": "$pageNumber", "date_gte": "${currentDate.toUtc()}"},
      ),
    ).events;
  }
}
