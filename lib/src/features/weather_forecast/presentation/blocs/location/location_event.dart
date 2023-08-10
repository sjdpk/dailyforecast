part of 'location_bloc.dart';

class LocationEvent extends Equatable {
  const LocationEvent();

  @override
  List<Object?> get props => [];
}

class GetLocationEvent extends LocationEvent {
  final String query;
  const GetLocationEvent({required this.query});
  @override
  List<Object?> get props => [
        query
      ];
}
