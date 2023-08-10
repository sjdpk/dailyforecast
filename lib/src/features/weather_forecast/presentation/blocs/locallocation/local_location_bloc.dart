import 'package:bloc/bloc.dart';
import 'package:dailyforecast/src/core/network/data_state.dart';
import 'package:dailyforecast/src/features/weather_forecast/domain/entities/locallocation.dart';
import 'package:dailyforecast/src/features/weather_forecast/domain/usecases/local/deletelocallocation.dart';
import 'package:dailyforecast/src/features/weather_forecast/domain/usecases/local/getallsave_location.dart';
import 'package:dailyforecast/src/features/weather_forecast/domain/usecases/local/savelocation.dart';
import 'package:equatable/equatable.dart';

part 'local_location_state.dart';
part 'local_location_event.dart';

class LocalLocationBloc extends Bloc<LocalLocationEvent, LocalLocationState> {
  final GetAllLocalLocationUseCase _allLocalLocationUseCase;
  final DeleteLocalLocationUseCase _deleteLocationUseCase;
  final SaveLocalLocationUseCase _saveLocationUseCase;

  LocalLocationBloc(this._allLocalLocationUseCase, this._saveLocationUseCase, this._deleteLocationUseCase) : super(LocalLocationLoadingState()) {
    on<GetLocalLocationEvent>(onGetLocalLocationEvent);
    on<SaveLocalLocationEvent>(onSaveLocalLocationEvent);
    on<DeleteLocalLocationEvent>(onDeleteLocalLocationEvent);
  }

  void onGetLocalLocationEvent(event, emit) async {
    final localLocations = await _allLocalLocationUseCase.execute();
    if (localLocations is DataSucessState && localLocations.data!.isEmpty) {
      emit(LocalLocationEmptyState());
    } else {
      emit(LocalLocationDoneState(localLocations.data!));
    }
  }

  void onSaveLocalLocationEvent(event, emit) async {
    _saveLocationUseCase.execute(location: event.localLocations);
    onGetLocalLocationEvent(event, emit);
  }

  void onDeleteLocalLocationEvent(event, emit) async {
    final int index = event.index;
    emit(LocalLocationLoadingState());
    _deleteLocationUseCase.execute(index: index);
    onGetLocalLocationEvent(event, emit);
  }
}
