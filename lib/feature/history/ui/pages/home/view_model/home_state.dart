class HomeState {
  final List<String> searches;
  final bool isLoading;
  final String? randomFact;
  HomeState({
    required this.searches,
    this.isLoading = false,
    this.randomFact,
  });

  HomeState copyWith({
    List<String>? searches,
    bool? isLoading,
    String? randomFact,
  }) {
    return HomeState(
      searches: searches ?? this.searches,
      isLoading: isLoading ?? this.isLoading,
      randomFact: randomFact,
    );
  }
}