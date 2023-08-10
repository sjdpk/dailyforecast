import 'package:dailyforecast/src/config/constants/colors.dart';
import 'package:dailyforecast/src/features/weather_forecast/domain/entities/statistics.dart';
import 'package:dailyforecast/src/features/weather_forecast/presentation/widgets/temperature_widget.dart';
import 'package:flutter/material.dart';

class StatisticDataWidget extends StatelessWidget {
  final num feelsLike;
  final num pressure;
  final num humidity;
  final num wind;
  const StatisticDataWidget({super.key, required this.feelsLike, required this.pressure, required this.humidity, required this.wind});

  @override
  Widget build(BuildContext context) {
    final List<StatisticsEntityModel> stData = getStatisticsEntityModelData(feelsLike: feelsLike, pressure: pressure, humidity: humidity, wind: wind);
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 2.4, mainAxisSpacing: 16),
      itemCount: stData.length,
      itemBuilder: (context, index) {
        final statisticsData = stData[index];
        return Row(
          children: [
            Container(
              height: 70,
              margin: const EdgeInsets.only(bottom: 10),
              width: 2,
              decoration: BoxDecoration(color: statisticsData.mainColor, boxShadow: [
                BoxShadow(color: statisticsData.shadowColor, offset: const Offset(1, 1))
              ]),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(statisticsData.title, style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
                  index == 0 ? TemperatureWidget(deg: feelsLike, fontSize: 34) : Text("${statisticsData.value}${statisticsData.unit}", style: const TextStyle(color: primaryColor, fontWeight: FontWeight.bold, fontSize: 34)),

                  const Spacer(),
                  // horizontal line
                  Visibility(
                    visible: index < (4 - 2),
                    child: Container(
                      margin: const EdgeInsets.only(left: 4),
                      width: 90,
                      color: Colors.grey.withOpacity(0.4),
                      height: 1,
                    ),
                  )
                ],
              ),
            ),
            // vertical line
          ],
        );
      },
    );
  }
}
