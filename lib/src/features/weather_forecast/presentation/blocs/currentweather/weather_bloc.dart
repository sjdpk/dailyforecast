import 'package:dailyforecast/src/core/network/data_state.dart';
import 'package:dailyforecast/src/features/weather_forecast/domain/entities/weather.dart';
import 'package:dailyforecast/src/features/weather_forecast/domain/usecases/getweather_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final CurrentWeatherUseCase _currentWeatherUseCase;
  WeatherBloc(this._currentWeatherUseCase) : super(WeatherLoadingState()) {
    on<GetWeatherEvents>(onGetWeatherEvents);
  }

  // @desc : Call Weather repo and change state with data/msg 
  void onGetWeatherEvents(event, emit) async {
    final num lat = event.lat;
    final num lon = event.lon;
    final dataState = await _currentWeatherUseCase.execute(lat: lat, lon: lon);
    if (dataState is DataSucessState && dataState.data != null) {
      emit(WeatherDoneState(dataState.data!));
    } else {
      emit(WeatherErrorState(dataState.error));
    }
  }
}
