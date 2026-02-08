import 'package:history_simple_app/feature/history/data/models/history_event.dart';

class ResultsState {
  bool isLoading;
  List<HistoryEvent>? events;

  ResultsState({this.isLoading = false, this.events});

  ResultsState copyWith({
    bool? isLoading,
    List<HistoryEvent>? events,
  }) {
    return ResultsState(
      isLoading: isLoading ?? this.isLoading,
      events: events ?? this.events,
    );
  }
}
