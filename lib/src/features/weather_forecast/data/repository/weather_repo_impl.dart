import 'dart:convert';
import 'dart:io';

import 'package:dailyforecast/src/core/network/data_state.dart';
import 'package:dailyforecast/src/features/weather_forecast/data/data_source/remote/remote_data_source.dart';
import 'package:dailyforecast/src/features/weather_forecast/data/models/location_model.dart';
import 'package:dailyforecast/src/features/weather_forecast/data/models/weather_model.dart';
import 'package:dailyforecast/src/features/weather_forecast/domain/entities/location.dart';
import 'package:dailyforecast/src/features/weather_forecast/domain/entities/weather.dart';
import 'package:dailyforecast/src/features/weather_forecast/domain/repository/weather_repo.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final RemoteWeatherDataSource _remoteWeatherDataSource;
  const WeatherRepositoryImpl(this._remoteWeatherDataSource);

  // @desc : get current weather condn from weatherRepository (remote)
  // @return : DatsState with sucess || error case
  @override
  Future<DataState<WeatherEntity>> getCurrentWeather({required num lat, required num lon}) async {
    try {
      final response = await _remoteWeatherDataSource.getCurrentWeather(lat: lat, lon: lon);
      final jsonData = json.decode(response.body);

      if (response.statusCode == HttpStatus.ok) {
        final weatherModelData = WeatherModel.fromJson(jsonData);
        return DataSucessState(weatherModelData.toEntity());
      } else {
        return DataErrorState(jsonData["message"]);
      }
    } on SocketException {
      return const DataErrorState("no internet connection");
    } catch (e) {
      return DataErrorState(e.toString());
    }
  }

  // @desc : get location 5days forecast list from weatherRepository (remote)
  // @return : DatsState with sucess || error case
  @override
  Future<DataState<List<WeatherEntity>>> getweaterForecastList({required num locationId}) async {
    try {
      final response = await _remoteWeatherDataSource.getweatherForecastList(locationId: locationId);
      final jsonData = json.decode(response.body);

      if (response.statusCode == HttpStatus.ok) {
        List<WeatherModel> weatherModelData = jsonData['list'].map<WeatherModel>((dynamic i) => WeatherModel.fromJson(i as Map<String, dynamic>)).toList();
        return DataSucessState(weatherModelData);
      } else {
        return DataErrorState(jsonData["message"]);
      }
    } on SocketException {
      return const DataErrorState("no internet connection");
    } catch (e) {
      return DataErrorState(e.toString());
    }
  }

  @override
  Future<DataState<List<LocationEntity>>> getLocationList({required String query}) async {
    try {
      final response = await _remoteWeatherDataSource.getLocationSuggesionList(query: query);
      final jsonData = jsonDecode(utf8.decode(response.bodyBytes));
      if (response.statusCode == HttpStatus.ok) {
        final List<dynamic> parsedJson = jsonData;
        List<LocationModel> locationModel = parsedJson.map((json) => LocationModel.fromJson(json)).toList();
        return DataSucessState(locationModel);
      } else {
        return DataErrorState(jsonData["error"]?['message']);
      }
    } on SocketException {
      return const DataErrorState("no internet connection");
    } catch (e) {
      return DataErrorState(e.toString());
    }
  }
}
