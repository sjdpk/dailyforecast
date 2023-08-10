import 'package:dailyforecast/src/core/network/data_state.dart';
import 'package:dailyforecast/src/features/weather_forecast/domain/entities/weather.dart';
import 'package:dailyforecast/src/features/weather_forecast/domain/usecases/remote/getweatherforecast_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
part 'forecast_weather_event.dart';
part 'forecast_weather_state.dart';

class WeatherForecastBloc extends Bloc<WeatherForecastEvent, WeatherForecastState> {
  final WeatherForecastListUseCase _forecastWeatherList;
  WeatherForecastBloc(this._forecastWeatherList) : super(WeatherForecastLoadingState()) {
    on<GetWeatherForecastEvents>(onGetWeatherForecastEvents);
  }

  void onGetWeatherForecastEvents(event, emit) async {
    final num locationId = event.locationId;
    final dataState = await _forecastWeatherList.execute(locationId: locationId);
    if (dataState is DataSucessState) {
      emit(WeatherForecastDoneState(dataState.data!));
    } else {
      emit(WeatherForecastErrorState(dataState.error));
    }
  }
}
