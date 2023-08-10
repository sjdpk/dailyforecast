import 'package:dailyforecast/src/config/constants/language.dart';
import 'package:dailyforecast/src/core/network/data_state.dart';
import 'package:dailyforecast/src/features/weather_forecast/domain/entities/location.dart';
import 'package:dailyforecast/src/features/weather_forecast/domain/usecases/remote/getlocation.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'location_state.dart';
part 'location_event.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  final LocationListUseCase _getLocationList;
  LocationBloc(this._getLocationList) : super(LocationLoadingState()) {
    on<GetLocationEvent>(onGetLocationEvent);
  }

  void onGetLocationEvent(event, emit) async {
    final String query = event.query;
    final locations = await _getLocationList.execute(query: query);
    if (locations is DataSucessState) {
      emit(LocationDoneState(locations.data!));
    } else if (locations is DataErrorState) {
      emit(const LocationErrorState(Language.lblErrorMsg));
    }
  }
}
