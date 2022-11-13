import 'package:capital_gain_calculator/main/main_event.dart';
import 'package:capital_gain_calculator/main/main_state.dart';
import 'package:cloud_sync_service/cloud_sync_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  final CloudSyncService _cloudSyncService;

  MainBloc(
    this._cloudSyncService,
  ) : super(MainState.idle()) {
    on<MainEventInit>((_, emit) async {
      final apiKey = await _cloudSyncService.getAlphavantageApiKey();

      print('LOG_: key => ${apiKey.alphavantageApiKey}');

      emit(MainState.idle());
    });
  }
}
