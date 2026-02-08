import 'package:history_simple_app/feature/history/data/models/history_event.dart';

class ResultsState {
  bool isLoading;
  final bool isOnline;
  List<HistoryEvent>? events;

  ResultsState({
    this.isLoading = false,
    this.isOnline = false,
    this.events,
  });

  ResultsState copyWith({
    bool? isLoading,
    bool? isOnline,
    List<HistoryEvent>? events,
  }) {
    return ResultsState(
      isLoading: isLoading ?? this.isLoading,
      isOnline: isOnline ?? this.isOnline,
      events: events ?? this.events,
    );
  }
}
