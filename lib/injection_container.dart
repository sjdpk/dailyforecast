import 'package:dailyforecast/src/features/weather_forecast/data/repository/weather_repo_impl.dart';
import 'package:dailyforecast/src/features/weather_forecast/domain/repository/weather_repo.dart';
import 'package:get_it/get_it.dart';
import 'src/features/weather_forecast/data/data_source/local/local_data_source.dart';
import 'src/features/weather_forecast/data/data_source/remote/remote_data_source.dart';
import 'src/features/weather_forecast/data/repository/local_location_repo_impl.dart';
import 'src/features/weather_forecast/domain/repository/locallocation_repo.dart';
import 'package:http/http.dart' as http;

import 'src/features/weather_forecast/domain/usecases/local/deletelocallocation.dart';
import 'src/features/weather_forecast/domain/usecases/local/getallsave_location.dart';
import 'src/features/weather_forecast/domain/usecases/local/savelocation.dart';
import 'src/features/weather_forecast/domain/usecases/remote/getlocation.dart';
import 'src/features/weather_forecast/domain/usecases/remote/getweather_usecase.dart';
import 'src/features/weather_forecast/domain/usecases/remote/getweatherforecast_usecase.dart';
import 'src/features/weather_forecast/presentation/blocs/currentweather/weather_bloc.dart';
import 'src/features/weather_forecast/presentation/blocs/forecastweather/forecast_weather_bloc.dart';
import 'src/features/weather_forecast/presentation/blocs/locallocation/local_location_bloc.dart';
import 'src/features/weather_forecast/presentation/blocs/location/location_bloc.dart';

final sl = GetIt.instance;

void init() async {
  // external
  sl.registerLazySingleton(() => http.Client());
  // Bloc initilize
  sl.registerFactory(() => WeatherBloc(sl()));
  sl.registerFactory(() => WeatherForecastBloc(sl()));
  sl.registerFactory(() => LocationBloc(sl()));
  sl.registerFactory(() => LocalLocationBloc(sl(), sl(), sl()));

  // usecase
  sl.registerLazySingleton(() => CurrentWeatherUseCase(sl()));
  sl.registerLazySingleton(() => WeatherForecastListUseCase(sl()));
  sl.registerLazySingleton(() => LocationListUseCase(sl()));

  sl.registerLazySingleton(() => GetAllLocalLocationUseCase(sl()));
  sl.registerLazySingleton(() => DeleteLocalLocationUseCase(sl()));
  sl.registerLazySingleton(() => SaveLocalLocationUseCase(sl()));

  // repository
  sl.registerLazySingleton<WeatherRepository>(() => WeatherRepositoryImpl(sl()));
  sl.registerLazySingleton<LocalLocationRepository>(() => LocalLocationRepositoryImpl(sl()));

  // data source
  sl.registerLazySingleton<RemoteWeatherDataSource>(() => RemoteWeatherDataSourceImpl(sl()));
  sl.registerLazySingleton<LocalLocationDataSource>(() => LocalLocationDataSourceImpl());

  await sl<LocalLocationDataSource>().initDb();
}
