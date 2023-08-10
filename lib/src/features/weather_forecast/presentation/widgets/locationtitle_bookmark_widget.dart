import 'package:dailyforecast/src/config/constants/colors.dart';
import 'package:dailyforecast/src/config/utils/datetime.dart';
import 'package:dailyforecast/src/features/weather_forecast/domain/entities/weather.dart';
import 'package:flutter/material.dart';

class LocationtitleBookmarkWidget extends StatelessWidget {
  final WeatherEntity weatherEntity;
  const LocationtitleBookmarkWidget({super.key, required this.weatherEntity});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${weatherEntity.cityName}, ${weatherEntity.country}",
              style: const TextStyle(color: primaryColor, fontWeight: FontWeight.bold, fontSize: 20),
              textAlign: TextAlign.center,
            ),
            Text(
              dateTimeUtils.formatDate(DateTime.now()),
              style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.w400),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        IconButton(onPressed: () async {}, icon: const Icon(Icons.bookmark_outlined, size: 30))
      ],
    );
  }
}
