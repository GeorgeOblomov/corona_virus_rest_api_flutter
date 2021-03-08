import 'package:corona_virus_rest_api_flutter_courses/app/services/api_keys.dart';
import 'package:flutter/material.dart';

enum Endpoint { cases, casesConfirmed, casesSuspected, deaths, recovered }

class API {
  final String apiKey;

  API({required this.apiKey});

  factory API.sandbox() => API(apiKey: APIKeys.ncovSandboxKey);

  static final String host = "ncov2019-admin.firebaseapp.com";

  Uri tokenUri() => Uri(scheme: 'https', host: host, path: 'token');

  Uri endpointUri(Endpoint endpoint) =>
      Uri(scheme: 'https', host: host, path: _paths[endpoint]);

  static Map<Endpoint, String> _paths = {
    Endpoint.cases: 'cases',
    Endpoint.casesConfirmed: 'casesConfirmed',
    Endpoint.casesSuspected: 'casesSuspected',
    Endpoint.deaths: 'deaths',
    Endpoint.recovered: 'recovered'
  };
}
