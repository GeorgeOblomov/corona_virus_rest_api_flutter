import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'api.dart';
import 'endpoint_data.dart';

class APIService {
  final API api;

  APIService(this.api);

  Future<String> getAccessToken() async {
    final response = await http.post(api.tokenUri(),
        headers: {'Authorization': 'Basic ${api.apiKey}'});
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final accessToken = data['access_token'];
      if (accessToken != null) {
        return accessToken;
      }
    }
    print(
        'Request ${api.tokenUri()} failed\nResponse: ${response.statusCode} ${response.reasonPhrase}');
    throw response;
  }

  // ignore: missing_return
  Future<EndpointData> getEndpointData(
      {required String? accessToken, required Endpoint endpoint}) async {
    final uri = api.endpointUri(endpoint);
    final response = await http
        .get(uri, headers: {'Authorization': 'Bearer $accessToken'});
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      if (data.isNotEmpty) {
        final Map<String, dynamic> endpointData = data[0];
        final responseJsonKey = _responseJsonKeys[endpoint];
        final int? value = endpointData[responseJsonKey!];
        final String dateString = endpointData['date'];
        final date = DateTime.tryParse(dateString);

        if (value != null) {
          return EndpointData(value: value, date: date);
        }
      }
    }
    print(
        'Request $uri failed\nResponse: ${response.statusCode} ${response.reasonPhrase}');
    throw response;
  }

  static Map<Endpoint, String> _responseJsonKeys = {
    Endpoint.cases: 'cases',
    Endpoint.casesConfirmed: 'data',
    Endpoint.casesSuspected: 'data',
    Endpoint.deaths: 'data',
    Endpoint.recovered: 'data'
  };
}
