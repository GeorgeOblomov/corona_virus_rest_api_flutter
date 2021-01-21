import 'package:corona_virus_rest_api_flutter_courses/app/services/api.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EndpointCardData {
  final String title;
  final String assetName;
  final Color color;

  EndpointCardData(this.title, this.assetName, this.color);
}

class EndpointCard extends StatelessWidget {
  final Endpoint endpoint;
  final int value;

  static Map<Endpoint, EndpointCardData> _cardData = {
    Endpoint.cases:
        EndpointCardData('Cases', 'assets/count.png', Color(0xFFFFF492)),
    Endpoint.casesConfirmed: EndpointCardData(
        'Confirmed cases', 'assets/fever.png', Color(0xFFE99600)),
    Endpoint.casesSuspected: EndpointCardData(
        'Suspected cases', 'assets/suspect.png', Color(0xFFEEDA28)),
    Endpoint.deaths:
        EndpointCardData('Deaths', 'assets/death.png', Color(0xFFE40000)),
    Endpoint.recovered:
        EndpointCardData('Recovered', 'assets/patient.png', Color(0xFF70A901))
  };
  EndpointCard({Key key, this.endpoint, this.value});

  String get formattedValue {
    if (value == null) {
      return '';
    }
    return NumberFormat('#,###,###,###').format(value);
  }

  @override
  Widget build(BuildContext context) {
    final cardData = _cardData[endpoint];
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                cardData.title,
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    .copyWith(color: cardData.color),
                maxLines: 2,
              ),
              SizedBox(height: 4),
              SizedBox(
                height: 52,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(cardData.assetName, color: cardData.color),
                    (value != null)
                        ? Text(
                            formattedValue,
                            style: Theme.of(context)
                                .textTheme
                                .headline4
                                .copyWith(
                                    color: cardData.color,
                                    fontWeight: FontWeight.w500),
                          )
                        : CircularProgressIndicator(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
