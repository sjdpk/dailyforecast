import 'package:dailyforecast/src/features/weather_forecast/presentation/screens/forecast_screen.dart';
import 'package:dailyforecast/src/features/weather_forecast/presentation/screens/weather_screen.dart';
import 'package:flutter/material.dart';

class RoutesList {
  static const String weatherScreen = "/";
  static const String forecastScreen = "/forecast";
}

class Routes {
  static Map<String, Widget Function(BuildContext context)> routes = {
    RoutesList.weatherScreen: (context) => const WeatherScreen(),
    RoutesList.forecastScreen: (context) => const WeatherForeCastScreen(),
  };
}
