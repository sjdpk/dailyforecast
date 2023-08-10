import 'package:dailyforecast/main.dart';
import 'package:dailyforecast/src/config/constants/language.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import 'search_location_widget.dart';

class LocationPermissonErrorWidget extends StatelessWidget {
  const LocationPermissonErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const SizedBox(height: 10),
          Text(appEnv.envConfig.applicatioName, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
          SizedBox(height: size.height / 4),
          SearchLocationWidget(),
          const SizedBox(height: 30),
          const Text(Language.lblSearchMsg, style: TextStyle(fontWeight: FontWeight.bold)),
          const Spacer(),
          TextButton(
            onPressed: () async {
              await Geolocator.openLocationSettings();
            },
            child: const Text(Language.lblLocationSetting, style: TextStyle(fontWeight: FontWeight.bold)),
          )
        ],
      ),
    );
  }
}
