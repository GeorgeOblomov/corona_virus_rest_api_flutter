import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LastUpdatedDateFormatter {
  final DateTime lastUpdated;

  LastUpdatedDateFormatter({@required this.lastUpdated});

  String lastUpdatedStatusText() {
    if (lastUpdated != null) {
      final formatter = DateFormat.yMd().add_Hms();
      final format = formatter.format(lastUpdated);
      return 'Last updated: $format';
    }
    return '';
  }
}

class LastUpdatedStatusText extends StatelessWidget {
  final String text;

  LastUpdatedStatusText({Key key, @required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        textAlign: TextAlign.center,
      ),
    );
  }
}
