import 'package:dailyforecast/src/config/constants/colors.dart';
import 'package:flutter/material.dart';

import 'temperature_widget.dart';

class WeatherInfoWidget extends StatelessWidget {
  final num deg;
  final String? status;
  final num? feelsDeg;

  const WeatherInfoWidget({super.key, required this.deg, this.status, this.feelsDeg});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TemperatureWidget(deg: deg),
        Text(status ?? "", style: const TextStyle(color: primaryColor, fontWeight: FontWeight.bold)),
        Text("Feels Like ${feelsDeg ?? deg}\u00B0", style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 12)),
      ],
    );
  }
}
