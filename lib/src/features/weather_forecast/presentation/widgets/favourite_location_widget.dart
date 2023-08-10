import 'package:dailyforecast/src/config/constants/colors.dart';
import 'package:dailyforecast/src/features/weather_forecast/presentation/blocs/currentweather/weather_bloc.dart';
import 'package:dailyforecast/src/features/weather_forecast/presentation/blocs/locallocation/local_location_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouritesLocationWidget extends StatelessWidget {
  const FavouritesLocationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<LocalLocationBloc>().add(const GetLocalLocationEvent());
    return BlocBuilder<LocalLocationBloc, LocalLocationState>(
      builder: (context, state) {
        if (state is LocalLocationEmptyState) {
          return const SizedBox(height: 15);
        } else if (state is LocalLocationDoneState) {
          final locationList = state.localLocations!;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              const Text("Favourites Location's", style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold, fontSize: 18)),
              const SizedBox(height: 10),
              SizedBox(
                height: 90,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: locationList.length,
                    itemBuilder: (context, index) {
                      final location = locationList[index];
                      return Stack(
                        children: [
                          GestureDetector(
                            onTap: () => context.read<WeatherBloc>().add(GetWeatherEvents(lat: location.latitude, lon: location.longitude)),
                            child: Container(
                              width: 200,
                              margin: const EdgeInsets.only(right: 8),
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: secondaryColor.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                children: [
                                  if (location.icon != null) Image.network(location.icon!),
                                  const SizedBox(width: 10),
                                  Text(location.name, style: const TextStyle(color: primaryColor, fontWeight: FontWeight.bold), overflow: TextOverflow.ellipsis),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            right: 8,
                            top: -6,
                            child: IconButton(
                              splashRadius: 1,
                              onPressed: () => context.read<LocalLocationBloc>().add(DeleteLocalLocationEvent(index)),
                              icon: const Icon(Icons.clear, color: Colors.red, size: 22),
                            ),
                          )
                        ],
                      );
                    }),
              ),
              const SizedBox(height: 6),
            ],
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
