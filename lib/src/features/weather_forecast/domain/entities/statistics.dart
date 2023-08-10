import 'package:dailyforecast/src/config/constants/colors.dart';
import 'package:flutter/material.dart';

class StatisticsEntityModel {
  final String title;
  final num value;
  final String unit;
  final Color mainColor;
  final Color shadowColor;
  const StatisticsEntityModel({
    required this.title,
    required this.value,
    required this.unit,
    required this.mainColor,
    required this.shadowColor,
  });
}

List<StatisticsEntityModel> getStatisticsEntityModelData({required num feelsLike, required num pressure, required num humidity, required num wind}) {
  final List<StatisticsEntityModel> statisticsData = [
    StatisticsEntityModel(
      title: "Feels Like",
      unit: "\u00B0",
      value: feelsLike,
      mainColor: Colors.orange,
      shadowColor: primaryColor,
    ),
    StatisticsEntityModel(
      title: "Pressure",
      unit: "hPa",
      value: pressure,
      mainColor: const Color(0xff8025F8),
      shadowColor: primaryColor,
    ),
    StatisticsEntityModel(
      title: "Humidity",
      unit: "%",
      value: humidity,
      mainColor: const Color(0xff31C6FF),
      shadowColor: primaryColor,
    ),
    StatisticsEntityModel(
      title: "Wind",
      value: wind,
      unit: "m/s",
      mainColor: const Color(0XFFFC3F77),
      shadowColor: primaryColor,
    ),
  ];
  return statisticsData;
}
