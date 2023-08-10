import 'package:dailyforecast/src/config/routes/routes.dart';
import 'package:dailyforecast/src/config/themes/themes.dart';
import 'package:dailyforecast/src/config/utils/common.dart';
import 'package:dailyforecast/src/core/env/base_env.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'injection_container.dart';
import 'src/config/utils/locations.dart';
import 'src/features/weather_forecast/data/data_source/local/dao.dart';
import 'src/features/weather_forecast/presentation/blocs/currentweather/weather_bloc.dart';
import 'src/features/weather_forecast/presentation/blocs/forecastweather/forecast_weather_bloc.dart';
import 'src/features/weather_forecast/presentation/blocs/locallocation/local_location_bloc.dart';
import 'src/features/weather_forecast/presentation/blocs/location/location_bloc.dart';
import 'injection_container.dart' as di;

Environment appEnv = Environment();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  appEnv.initEnvConfig(environment);
  init();
  await Hive.initFlutter();
  await Hive.openBox<LocalLocationDAO>(appEnv.envConfig.locationDb);
  await locationUtils.requestLocationPermission();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => di.sl<WeatherBloc>()),
        BlocProvider(create: (_) => di.sl<WeatherForecastBloc>()),
        BlocProvider(create: (_) => di.sl<LocationBloc>()),
        BlocProvider(create: (_) => di.sl<LocalLocationBloc>()),
      ],
      child: GestureDetector(
        onTap: () => commonUtils.hideKeyboard(context),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: appEnv.envConfig.applicatioName,
          theme: themeConfig.darkMode,
          routes: Routes.routes,
        ),
      ),
    );
  }
}
