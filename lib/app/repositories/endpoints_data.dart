import 'package:corona_virus_rest_api_flutter_courses/app/services/api.dart';
import 'package:flutter/foundation.dart';

class EndpointsData {
  final Map<Endpoint, int> values;

  EndpointsData({@required this.values});

  int get cases => values[Endpoint.cases];
  int get casesConfirmed => values[Endpoint.casesConfirmed];
  int get casesSuspected => values[Endpoint.casesSuspected];
  int get deaths => values[Endpoint.deaths];
  int get recovered => values[Endpoint.recovered];

  @override
  String toString() {
    return 'cases: $cases, confirmed: $casesConfirmed, suspected: $casesSuspected, deaths: $deaths,'
        'recovered: $recovered';
  }
}
