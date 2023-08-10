import 'package:dailyforecast/src/features/weather_forecast/data/repository/weather_repo_impl.dart';
import 'package:dailyforecast/src/features/weather_forecast/domain/repository/weather_repo.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import 'src/features/weather_forecast/data/data_source/remote/remote_data_source.dart';
import 'src/features/weather_forecast/domain/usecases/getweather_usecase.dart';
import 'src/features/weather_forecast/domain/usecases/getweatherforecast_usecase.dart';
import 'src/features/weather_forecast/presentation/blocs/currentweather/weather_bloc.dart';
import 'src/features/weather_forecast/presentation/blocs/forecastweather/forecast_weather_bloc.dart';

final sl = GetIt.instance;

void init() async {
  // external
  sl.registerLazySingleton(() => http.Client());
  // Bloc initilize
  sl.registerFactory(() => WeatherBloc(sl()));
  sl.registerFactory(() => WeatherForecastBloc(sl()));

  // usecase
  sl.registerLazySingleton(() => CurrentWeatherUseCase(sl()));
  sl.registerLazySingleton(() => WeatherForecastListUseCase(sl()));

  // repository
  sl.registerLazySingleton<WeatherRepository>(() => WeatherRepositoryImpl(sl()));

  // data source
  sl.registerLazySingleton<RemoteWeatherDataSource>(() => RemoteWeatherDataSourceImpl(sl()));
}
