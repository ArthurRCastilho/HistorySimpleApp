class HistoryDetailsState {
  bool? isOnline;

  HistoryDetailsState({
    this.isOnline = false,
  });

  HistoryDetailsState copyWith({bool? isOnline}) {
    return HistoryDetailsState(isOnline: isOnline ?? this.isOnline);
  }
}
