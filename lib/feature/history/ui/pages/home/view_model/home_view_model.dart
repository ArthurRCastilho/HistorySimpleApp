import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class HomeState {
  final List<String> searches;
  HomeState({required this.searches});
}

class HomeViewModel extends Cubit<HomeState> {
  final TextEditingController controller = TextEditingController();

  HomeViewModel() : super(HomeState(searches: ['2025', '2023']));

  void addSearch() {
    final text = controller.text;
    if (text.isNotEmpty) {
      final updatedList = List<String>.from(state.searches)..insert(0, text);
      emit(HomeState(searches: updatedList));
      controller.clear();
    }
  }

  void clearHistory() {
    emit(HomeState(searches: []));
  }

  @override
  Future<void> close() {
    controller.dispose();
    return super.close();
  }
}
