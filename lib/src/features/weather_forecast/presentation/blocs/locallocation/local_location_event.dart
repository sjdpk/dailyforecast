part of 'local_location_bloc.dart';

class LocalLocationEvent extends Equatable {
  const LocalLocationEvent();

  @override
  List<Object?> get props => [];
}

class GetLocalLocationEvent extends LocalLocationEvent {
  const GetLocalLocationEvent();
}

class SaveLocalLocationEvent extends LocalLocationEvent {
  final LocalLocationEntity localLocations;
  const SaveLocalLocationEvent({required this.localLocations});
  @override
  List<Object?> get props => [
        localLocations
      ];
}

class DeleteLocalLocationEvent extends LocalLocationEvent {
  final int index;
  const DeleteLocalLocationEvent(this.index);
  @override
  List<Object?> get props => [
        index
      ];
}
