import 'package:corona_virus_rest_api_flutter_courses/app/repositories/data_repository.dart';
import 'package:corona_virus_rest_api_flutter_courses/app/repositories/endpoints_data.dart';
import 'package:corona_virus_rest_api_flutter_courses/app/services/api.dart';
import 'package:corona_virus_rest_api_flutter_courses/app/ui/endpoint_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  EndpointsData _endpointsData;

  @override
  void initState() {
    super.initState();
    _updateData();
  }

  Future<void> _updateData() async {
    final dataRepository = Provider.of<DataRepository>(context, listen: false);
    final endpointsData = await dataRepository.getAllEndpointsData();
    setState(() {
      _endpointsData = endpointsData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Coronavirus Tracker'),
      ),
      body: RefreshIndicator(
        onRefresh: _updateData,
        child: ListView(
          children: [
            for (var endpoint in Endpoint.values)
              EndpointCard(
                endpoint: endpoint,
                value: (_endpointsData != null)
                    ? _endpointsData.values[endpoint]
                    : null,
              ),
          ],
        ),
      ),
    );
  }
}
