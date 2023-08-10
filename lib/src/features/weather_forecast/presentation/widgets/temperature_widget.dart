import 'package:dailyforecast/src/config/constants/colors.dart';
import 'package:flutter/material.dart';

class TemperatureWidget extends StatelessWidget {
  final num? deg;
  final double? fontSize;
  final String? degUnit;
  final FontWeight? fontWeight;
  const TemperatureWidget({super.key, this.deg, this.fontSize = 50, this.degUnit = "\u00B0", this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: "$deg",
        style: TextStyle(fontSize: fontSize, color: primaryColor, fontWeight: fontWeight ?? FontWeight.bold),
        children: [
          TextSpan(
            text: degUnit,
            style: TextStyle(fontSize: fontSize, color: iconColor, fontWeight: fontWeight ?? FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
