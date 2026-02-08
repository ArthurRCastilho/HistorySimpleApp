import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:history_simple_app/feature/history/data/repositories/history_repository.dart';
import 'package:history_simple_app/core/utils/utils/loggy.dart';
import 'package:history_simple_app/feature/history/ui/pages/home/view_model/home_state.dart';

class HomeViewModel extends Cubit<HomeState> with HomeViewModelLoggy {
  final HistoryRepository _repository;
  final TextEditingController controller = TextEditingController();

  HomeViewModel({
    required HistoryRepository historyRepository,
  }) : _repository = historyRepository,
       super(HomeState(searches: [])) {
    _init();
  }

  Future<void> _init() async {
    emit(state.copyWith(isLoading: true));
    final recentSearchs = await _repository.getRecentSearches();
    emit(state.copyWith(isLoading: false, searches: recentSearchs));
  }

  Future<void> addSearch() async {
    final year = controller.text;
    if (year.isEmpty) return;
    await _repository.saveSearch(year);
    final updatedList = List<String>.from(state.searches);
    if (!updatedList.contains(year)) {
      updatedList.insert(0, year);
    }
    if (updatedList.length > 20) updatedList.removeLast();

    emit(state.copyWith(searches: updatedList));
    controller.clear();
  }

  Future<void> clearHistory() async {
    await _repository.clearSearchHistory();
    emit(state.copyWith(searches: []));
  }

  Future<void> newRandomFact() async {
    emit(
      state.copyWith(
        isLoading: true,
        randomFact: '',
      ),
    );
    try {
      final String? response = await _repository.getRandomHistoryFact();
      emit(
        state.copyWith(
          isLoading: false,
          randomFact: response,
        ),
      );
    } catch (e) {
      loggy.warning('Erro ao buscar na internet: $e');
    }
  }

  @override
  Future<void> close() {
    controller.dispose();
    return super.close();
  }
}
