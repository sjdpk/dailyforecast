import 'package:dailyforecast/main.dart';
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
          Text(appEnv.envConfig.applicatioName, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
          SizedBox(height: size.height / 4),
          SearchLocationWidget(),
          SizedBox(height: 30),
          const Text("Search Location To Get Weather Detail's", style: TextStyle(fontWeight: FontWeight.bold)),
          Spacer(),
          TextButton(
            onPressed: () async {
              await Geolocator.openLocationSettings();
            },
            child: Text("Open Location Setting", style: TextStyle(fontWeight: FontWeight.bold)),
          )
        ],
      ),
    );
  }
}
