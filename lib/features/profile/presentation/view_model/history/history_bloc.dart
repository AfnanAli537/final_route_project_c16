import 'package:final_route_projcet_c16/core/cashe/history_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'history_event.dart';
import 'history_state.dart';

@injectable
class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  HistoryBloc() : super(HistoryInitial()) {
    on<LoadHistory>((event, emit) async {
      emit(HistoryLoading());
      try {
        final history = await HistoryHelper.getHistory();
        emit(HistoryLoaded(history));
      } catch (_) {
        emit(HistoryError('Failed to load history'));
      }
    });

    on<AddHistoryItem>((event, emit) async {
      try {
        await HistoryHelper.addToHistory(event.title, event.image, event.rating, event.id);
        final history = await HistoryHelper.getHistory();
        emit(HistoryLoaded(history));
      } catch (_) {
        emit(HistoryError('Failed to add item'));
      }
    });

    on<ClearHistory>((event, emit) async {
      try {
        await HistoryHelper.clearHistory();
        emit(HistoryLoaded([]));
      } catch (_) {
        emit(HistoryError('Failed to clear history'));
      }
    });
  }
}
