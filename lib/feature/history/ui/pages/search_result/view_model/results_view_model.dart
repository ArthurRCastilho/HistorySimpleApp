import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:history_simple_app/core/network/has_internet_connection.dart';
import 'package:history_simple_app/core/utils/utils/loggy.dart';
import 'package:history_simple_app/feature/history/data/repositories/repositories.dart';
import 'package:history_simple_app/feature/history/ui/pages/search_result/view_model/results_state.dart';

class ResultsViewModel extends Cubit<ResultsState> with ResultsViewModelLoggy {
  final HistoryRepository _historyRepository;
  ResultsViewModel({
    required HistoryRepository historyRepository,
  }) : _historyRepository = historyRepository,
       super(ResultsState(events: []));

  Future<void> fetchResults(String year) async {
    emit(state.copyWith(isLoading: true));
    final bool online = await HasInternetConnection.hasInternet();
    try {
      final results = await _historyRepository.getHistory(year);
      emit(
        state.copyWith(
          events: results,
          isLoading: false,
          isOnline: online,
        ),
      );
    } catch (e) {
      loggy.error('Erro ao carregar resultados para o ano $year: $e');
      emit(state.copyWith(isLoading: false));
    }
  }

  @override
  Future<void> close() {
    emit(state.copyWith(isLoading: false, events: []));
    return super.close();
  }
}
