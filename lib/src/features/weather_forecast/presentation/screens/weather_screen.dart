import 'package:dailyforecast/src/config/constants/language.dart';
import 'package:dailyforecast/src/config/routes/routes.dart';
import 'package:dailyforecast/src/core/textstyle.dart';
import 'package:dailyforecast/src/features/weather_forecast/presentation/blocs/currentweather/weather_bloc.dart';
import 'package:dailyforecast/src/features/weather_forecast/presentation/blocs/forecastweather/forecast_weather_bloc.dart';
import 'package:dailyforecast/src/features/weather_forecast/presentation/widgets/favourite_location_widget.dart';
import 'package:dailyforecast/src/features/weather_forecast/presentation/widgets/image_widget.dart';
import 'package:dailyforecast/src/features/weather_forecast/presentation/widgets/loader.dart';
import 'package:dailyforecast/src/features/weather_forecast/presentation/widgets/locationtitle_bookmark_widget.dart';
import 'package:dailyforecast/src/features/weather_forecast/presentation/widgets/search_location_widget.dart';
import 'package:dailyforecast/src/features/weather_forecast/presentation/widgets/statisticsdata_widget.dart';
import 'package:dailyforecast/src/features/weather_forecast/presentation/widgets/weather_forecast_widget.dart';
import 'package:dailyforecast/src/features/weather_forecast/presentation/widgets/weather_info_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/errorlocpermission_widget.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<WeatherBloc>().add(const GetWeatherEvents());

    return Scaffold(
      appBar: AppBar(toolbarHeight: 0),
      body: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          if (state is WeatherLoadingState) {
            return const LoaderWidget();
          } else if (state is WeatherDoneState) {
            context.read<WeatherForecastBloc>().add(GetWeatherForecastEvents(locationId: state.weatherEntity.id!));
            return ListView(
              padding: const EdgeInsets.all(16),
              children: [
                LocationtitleBookmarkWidget(weatherEntity: state.weatherEntity),
                const SizedBox(height: 20),
                SearchLocationWidget(),
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
                    const Text(Language.lblStatistics, style: primaryTextStyle),
                    GestureDetector(
                      onTap: () => Navigator.popAndPushNamed(context, RoutesList.forecastScreen),
                      child: const Text(Language.lblViewReport, style: secondaryTextStyle),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                StatisticDataWidget(
                  feelsLike: state.weatherEntity.fLike ?? 0,
                  pressure: state.weatherEntity.pressure ?? 0,
                  humidity: state.weatherEntity.humidity ?? 0,
                  wind: state.weatherEntity.windSpeed ?? 0,
                ),
                const SizedBox(height: 20),
              ],
            );
          } else if (state is WeatherErrorState) {
            if (state.message == Language.lblNoLcnPermsnMsg) return const LocationPermissonErrorWidget();
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(state.message ?? Language.lblErrorMsg),
                  const SizedBox(height: 10),
                  TextButton(
                    onPressed: () {
                      context.read<WeatherBloc>().add(const GetWeatherEvents(lat: 27.6545, lon: 85.6788));
                    },
                    child: const Text(Language.lblRefresh),
                  )
                ],
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
