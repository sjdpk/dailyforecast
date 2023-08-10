part of 'location_bloc.dart';

class LocationState extends Equatable {
  const LocationState();
  @override
  List<Object?> get props => [];
}

class LocationLoadingState extends LocationState {}

class LocationDoneState extends LocationState {
  final List<LocationEntity> locationList;
  const LocationDoneState(this.locationList);
  @override
  List<Object?> get props => [
        locationList
      ];
}

class LocationErrorState extends LocationState {
  final String? message;
  const LocationErrorState(this.message);
  @override
  List<Object?> get props => [
        message
      ];
}
