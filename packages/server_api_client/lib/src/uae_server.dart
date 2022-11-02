import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:uae_api_client/server_api_client.dart';

class UaeServer extends ServerApiClient {
  UaeServer({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  static const _authority = "test.meetntrain.com";

  //todo: get _token from user auth serves.
  static const _token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjgzNTcsImlzQWRtaW4iOmZhbHNlLCJpYXQiOjE2NjQ5NzU4OTN9.1msUlsgpO4dRbj55VhJsX0eyNDcLjsCiRfj26Z54zGE";
  static const _headers = {
    'Content-Type': 'application/json; charset=UTF-8',
    'authorization': _token
  };

  final http.Client _httpClient;

  // http://test.meetntrain.com/v1/profile/events/upcoming/8357/?page=1&date_gte=2022-10-31+13%3A18%3A45.762622Z
  // http://test.meetntrain.com/v1/profile/events/upcoming/${userId}/?page=${pageNumber}&date_gte=${currentDate}
  @override
  Future<List<dynamic>> getResponse(
      {required String path, required Map<String, String> params}) async {
    final uri = Uri.http(_authority, path, params);
    print(uri);
    final response = await _httpClient.get(
      uri,
      headers: _headers,
    );
    if (response.statusCode == 200) {
      return json.decode(response.body);
    }
    //todo: handle other statusCodes and throw readable Exceptions
    else
      throw Exception('error getting response');
  }
}
