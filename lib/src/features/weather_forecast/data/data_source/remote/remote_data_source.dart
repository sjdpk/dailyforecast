import 'package:dailyforecast/main.dart';
import 'package:http/http.dart' as http;

abstract class RemoteWeatherDataSource {
  Future<http.Response> getCurrentWeather({required num lat, required num lon});
  Future<http.Response> getweatherForecastList({required num locationId});
}

class RemoteWeatherDataSourceImpl implements RemoteWeatherDataSource {
  final http.Client _client;
  RemoteWeatherDataSourceImpl(this._client);

  final String baseUrl = appEnv.envConfig.baseUrl;
  final String appId = appEnv.envConfig.weatherApiKey;

  // @desc :  get current weather conditon based on location latitude and longitude
  // @return : http Response [statusCode,request, body ...]
  @override
  Future<http.Response> getCurrentWeather({required num lat, required num lon}) async {
    final response = await _client.get(Uri.parse("$baseUrl/weather?lat=$lat&lon=$lon&appid=$appId"));
    return response;
  }

  // @desc :  get 5day weather foirecast based on location id
  // @return : http Response [statusCode,request, body ...]
  @override
  Future<http.Response> getweatherForecastList({required num locationId}) async {
    final response = await _client.get(Uri.parse("$baseUrl/forecast?id=$locationId&appid=$appId"));
    return response;
  }
}
