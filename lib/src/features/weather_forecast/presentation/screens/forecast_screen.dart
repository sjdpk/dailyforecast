import 'package:dailyforecast/src/config/constants/colors.dart';
import 'package:dailyforecast/src/config/utils/datetime.dart';
import 'package:dailyforecast/src/features/weather_forecast/presentation/blocs/currentweather/weather_bloc.dart';
import 'package:dailyforecast/src/features/weather_forecast/presentation/blocs/forecastweather/forecast_weather_bloc.dart';
import 'package:dailyforecast/src/features/weather_forecast/presentation/widgets/forecast_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeatherForeCastScreen extends StatelessWidget {
  const WeatherForeCastScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () => Navigator.of(context).pop(), icon: const Icon(Icons.arrow_back_ios, color: primaryColor)),
        title: const Text(
          "Forecast Reports",
          style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold, fontSize: labelTextSize),
        ),
        backgroundColor: backgroundColor,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Today", style: TextStyle(color: primaryColor)),
              Text(dateTimeUtils.formatDate(DateTime.now()), style: const TextStyle(color: primaryColor))
            ],
          ),
          const SizedBox(height: 30),
          BlocBuilder<WeatherBloc, WeatherState>(builder: (context, state) {
            if (state is WeatherDoneState) {
              return ForeCastCardWidget(icon: state.weatherEntity.weatherIcon, deg: state.weatherEntity.temp!, location: state.weatherEntity.cityName ?? "", country: state.weatherEntity.country ?? "", status: state.weatherEntity.main ?? "");
            } else {
              return const Text("Loading...");
            }
          }),
          const SizedBox(height: 30),
          const Text("Next 5 Days Forecast", style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 10),
          BlocBuilder<WeatherForecastBloc, WeatherForecastState>(
            builder: (context, state) {
              if (state is WeatherForecastDoneState) {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: state.weatherForecastList.length,
                  itemBuilder: (context, index) {
                    final weather = state.weatherForecastList[index];
                    if (dateTimeUtils.formatDateTime(weather.dateTime, check: true) == "") return const SizedBox.shrink();
                    return ForeCastCardWidget(
                      isForecast: true,
                      icon: weather.weatherIcon,
                      deg: weather.temp!,
                      dateTime: dateTimeUtils.formatDateTime(weather.dateTime),
                      status: weather.main ?? "",
                    );
                  },
                );
              } else {
                return const Text("Loading...");
              }
            },
          ),
        ],
      ),
    );
  }
}
