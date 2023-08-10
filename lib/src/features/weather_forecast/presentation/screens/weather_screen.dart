import 'package:dailyforecast/src/config/constants/colors.dart';
import 'package:dailyforecast/src/features/weather_forecast/presentation/blocs/currentweather/weather_bloc.dart';
import 'package:dailyforecast/src/features/weather_forecast/presentation/blocs/forecastweather/forecast_weather_bloc.dart';
import 'package:dailyforecast/src/features/weather_forecast/presentation/widgets/favourite_location_widget.dart';
import 'package:dailyforecast/src/features/weather_forecast/presentation/widgets/image_widget.dart';
import 'package:dailyforecast/src/features/weather_forecast/presentation/widgets/locationtitle_bookmark_widget.dart';
import 'package:dailyforecast/src/features/weather_forecast/presentation/widgets/search_location_widget.dart';
import 'package:dailyforecast/src/features/weather_forecast/presentation/widgets/statisticsdata_widget.dart';
import 'package:dailyforecast/src/features/weather_forecast/presentation/widgets/weather_forecast_widget.dart';
import 'package:dailyforecast/src/features/weather_forecast/presentation/widgets/weather_info_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'forecast_screen.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO : change Location Latitude as per current location
    // Demo lat and long for testing
    context.read<WeatherBloc>().add(const GetWeatherEvents(lat: 27.6545, lon: 85.6788));

    return Scaffold(
      appBar: AppBar(toolbarHeight: 0),
      body: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          if (state is WeatherLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is WeatherDoneState) {
            context.read<WeatherForecastBloc>().add(GetWeatherForecastEvents(locationId: state.weatherEntity.id!));
            return ListView(
              padding: const EdgeInsets.all(16),
              children: [
                LocationtitleBookmarkWidget(weatherEntity: state.weatherEntity),
                const SizedBox(height: 20),
                const SearchLocationWidget(),
                const SizedBox(height: 20),
                WeatherInfoImageWidget(icon: state.weatherEntity.weatherIcon),
                const SizedBox(height: 10),
                SizedBox(
                  height: 105,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(child: WeatherInfoWidget(deg: state.weatherEntity.temp!, status: state.weatherEntity.main, feelsDeg: state.weatherEntity.fLike)),
                      // second part
                      const Expanded(child: WeatherForecastDataWidget()),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                const FavouritesLocationWidget(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Statistics", style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold, fontSize: 18)),
                    GestureDetector(
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const WeatherForeCastScreen())),
                      child: const Text(
                        "View Forecast Reports",
                        style: TextStyle(color: iconColor, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                StatisticDataWidget(feelsLike: state.weatherEntity.fLike ?? 0, pressure: state.weatherEntity.pressure ?? 0, humidity: state.weatherEntity.humidity ?? 0, wind: state.weatherEntity.windSpeed ?? 0),
                const SizedBox(height: 20),
              ],
            );
          } else if (state is WeatherErrorState) {
            return Center(
              child: Container(
                color: secondaryColor.withOpacity(0.4),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(state.message ?? "Something went wrong try again"),
                    SizedBox(height: 10),
                    TextButton(
                      onPressed: () {
                        context.read<WeatherBloc>().add(const GetWeatherEvents(lat: 27.6545, lon: 85.6788));
                      },
                      child: Text("Refresh Again!"),
                    )
                  ],
                ),
              ),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
