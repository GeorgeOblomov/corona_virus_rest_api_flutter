import 'package:corona_virus_rest_api_flutter_courses/app/services/api.dart';
import 'package:corona_virus_rest_api_flutter_courses/app/services/endpoint_data.dart';
import 'package:flutter/foundation.dart';

class EndpointsData {
  final Map<Endpoint, EndpointData> values;

  EndpointsData({@required this.values});

  EndpointData get cases => values[Endpoint.cases];
  EndpointData get casesConfirmed => values[Endpoint.casesConfirmed];
  EndpointData get casesSuspected => values[Endpoint.casesSuspected];
  EndpointData get deaths => values[Endpoint.deaths];
  EndpointData get recovered => values[Endpoint.recovered];

  @override
  String toString() {
    return 'cases: $cases, confirmed: $casesConfirmed, suspected: $casesSuspected, deaths: $deaths,'
        'recovered: $recovered';
  }
}
