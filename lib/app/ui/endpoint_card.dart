import 'package:corona_virus_rest_api_flutter_courses/app/services/api.dart';
import 'package:flutter/material.dart';

class EndpointCard extends StatelessWidget {
  final Endpoint endpoint;
  final int value;

  static Map<Endpoint, String> _cardTitles = {
    Endpoint.cases: 'Cases',
    Endpoint.casesConfirmed: 'Confirmed cases',
    Endpoint.casesSuspected: 'Suspected cases',
    Endpoint.deaths: 'Deaths',
    Endpoint.recovered: 'Recovered'
  };
  //TODO: Make possible to prevent overflow by 18 pixels on the right
  EndpointCard({Key key, this.endpoint, this.value});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 3,
                child: Text(
                  _cardTitles[endpoint],
                  style: Theme.of(context).textTheme.headline5,
                  maxLines: 2,
                ),
              ),
              (value != null)
                  ? Text(
                      value != null ? value.toString() : '',
                      style: Theme.of(context).textTheme.headline4,
                    )
                  : CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}
