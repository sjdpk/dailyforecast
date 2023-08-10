import 'package:dailyforecast/src/config/constants/colors.dart';
import 'package:dailyforecast/src/config/utils/datetime.dart';
import 'package:dailyforecast/src/features/weather_forecast/presentation/blocs/forecastweather/forecast_weather_bloc.dart';
import 'package:dailyforecast/src/features/weather_forecast/presentation/widgets/temperature_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'image_widget.dart';

class WeatherForecastDataWidget extends StatelessWidget {
  const WeatherForecastDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherForecastBloc, WeatherForecastState>(
      builder: (context, state) {
        if (state is WeatherForecastLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is WeatherForecastDoneState) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              2,
              (index) => Row(
                children: [
                  WeatherInfoImageWidget(icon: state.weatherForecastList[index].weatherIcon, height: 50),
                  const SizedBox(width: 14),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(dateTimeUtils.convertTo12hrFormat(state.weatherForecastList[index].dateTime), style: const TextStyle(color: primaryColor, fontWeight: FontWeight.bold)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("${state.weatherForecastList[index].main!} - ", style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 12)),
                          TemperatureWidget(deg: state.weatherForecastList[index].temp, fontSize: 8, fontWeight: FontWeight.w400),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
