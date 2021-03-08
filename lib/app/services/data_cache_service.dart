import 'package:corona_virus_rest_api_flutter_courses/app/repositories/endpoints_data.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'api.dart';
import 'endpoint_data.dart';

class DataCacheService {
  final SharedPreferences prefs;

  static String endpointValueKey(Endpoint endpoint) => '$endpoint/value';
  static String endpointDateKey(Endpoint endpoint) => '$endpoint/date';

  DataCacheService({required this.prefs});

  Future<void> setData(EndpointsData endpointsData) async {
    endpointsData.values.forEach((endpoint, endpointData) async {
      await prefs.setInt(endpointValueKey(endpoint), endpointData.value);
      await prefs.setString(
          endpointDateKey(endpoint), endpointData.date!.toIso8601String());
    });
  }

  EndpointsData getData() {
    Map<Endpoint, EndpointData> values = {};
    Endpoint.values.forEach((endpoint) {
      final value = prefs.getInt(endpointValueKey(endpoint));
      final dateString = prefs.getString(endpointDateKey(endpoint));
      if (value != null && dateString != null) {
        final date = DateTime.tryParse(dateString);
        values[endpoint] = EndpointData(value: value, date: date);
      }
    });
    return EndpointsData(values: values);
  }
}
