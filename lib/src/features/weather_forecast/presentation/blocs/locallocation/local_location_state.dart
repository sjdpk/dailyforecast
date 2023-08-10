part of 'local_location_bloc.dart';

abstract class LocalLocationState extends Equatable {
  const LocalLocationState();
  @override
  List<Object?> get props => [];
}

class LocalLocationEmptyState extends LocalLocationState {}

class LocalLocationLoadingState extends LocalLocationState {}

class LocalLocationDoneState extends LocalLocationState {
  final List<LocalLocationEntity>? localLocations;
  const LocalLocationDoneState(this.localLocations);
  @override
  List<Object?> get props => [
        localLocations
      ];
}

class LocalLocationStoreErrorState extends LocalLocationState {
  final String? message;

  const LocalLocationStoreErrorState(this.message);
  @override
  List<Object?> get props => [
        message
      ];
}
