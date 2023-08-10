import 'package:dailyforecast/src/config/constants/colors.dart';
import 'package:dailyforecast/src/features/weather_forecast/domain/entities/location.dart';
import 'package:dailyforecast/src/features/weather_forecast/presentation/blocs/currentweather/weather_bloc.dart';
import 'package:dailyforecast/src/features/weather_forecast/presentation/blocs/location/location_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:searchfield/searchfield.dart';

class SearchLocationWidget extends StatelessWidget {
  final double? height;
  SearchLocationWidget({super.key, this.height});
  final TextEditingController searchCtr = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocationBloc, LocationState>(
      builder: (context, state) {
        return ClipRRect(
          borderRadius: (state is LocationDoneState && state.locationList.isNotEmpty) ? const BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)) : BorderRadius.circular(8),
          child: SearchField<LocationEntity>(
            controller: searchCtr,
            suggestions: (state is LocationDoneState) ? state.locationList.map((e) => SearchFieldListItem<LocationEntity>(e.displayName ?? "", item: e)).toList() : [],
            searchInputDecoration: InputDecoration(
              filled: true,
              fillColor: secondaryColor.withOpacity(0.4),
              prefixIcon: const Icon(Icons.search),
              contentPadding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
              border: InputBorder.none,
              hintText: "Search Locations",
              hintStyle: const TextStyle(color: primaryColor),
              suffixIcon: Visibility(
                visible: searchCtr.text.isNotEmpty,
                child: IconButton(
                  onPressed: () {
                    searchCtr.clear();
                    context.read<LocationBloc>().add(const GetLocationEvent(query: ""));
                  },
                  icon: Icon(Icons.clear),
                ),
              ),
            ),
            onSearchTextChanged: (String text) {
              context.read<LocationBloc>().add(GetLocationEvent(query: text.toLowerCase()));
              return null;
            },
            onSuggestionTap: (location) {
              context.read<WeatherBloc>().add(GetWeatherEvents(lat: double.parse(location.item!.lat!), lon: double.parse(location.item!.lon!)));
              context.read<LocationBloc>().add(const GetLocationEvent(query: ""));
              FocusScope.of(context).requestFocus(FocusNode());
            },
          ),
        );
      },
    );
  }
}
