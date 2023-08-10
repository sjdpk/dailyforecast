import 'package:dailyforecast/src/config/constants/colors.dart';
import 'package:flutter/material.dart';

import 'temperature_widget.dart';

class ForeCastCardWidget extends StatelessWidget {
  final String icon;
  final String? location;
  final String? country;
  final String? status;
  final num deg;
  final bool isForecast;
  final String? dateTime;
  const ForeCastCardWidget({super.key, required this.icon, this.location, this.status, required this.deg, this.country, this.isForecast = false, this.dateTime});

  @override
  Widget build(BuildContext context) {
    if (isForecast) {
      return Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: isForecast ? secondaryColor.withOpacity(0.2) : secondaryColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(dateTime!),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TemperatureWidget(deg: deg, fontSize: 20),
                Text("$status ", style: const TextStyle(color: secondaryColor))
              ],
            ),
            Image.network(icon, height: 60),
          ],
        ),
      );
    }
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.network(icon, height: 60),
              Visibility(visible: location != null, child: Text("$location, $country \n$status ", style: const TextStyle(color: primaryColor))),
            ],
          ),
          TemperatureWidget(deg: deg, fontSize: isForecast ? 20 : 34),
        ],
      ),
    );
  }
}
