import 'dart:async';

/// {@template ServerApiClient}
/// Dart API Client which wraps the [MeetNTrain API](http://test.meetntrain.com/v1/).
/// {@endtemplate}

abstract class ServerApiClient {
  Future<List<dynamic>> getResponse(
      {required String path, required Map<String, String> params});
}
