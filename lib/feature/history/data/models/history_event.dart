class HistoryEvent {
  final int? id;
  final String year;
  final String month;
  final String day;
  final String event;

  HistoryEvent({
    this.id,
    required this.year,
    required this.month,
    required this.day,
    required this.event,
  });

  factory HistoryEvent.fromJson(Map<String, dynamic> json) {
    return HistoryEvent(
      year: json['year'] ?? '',
      month: json['month'] ?? '',
      day: json['day'] ?? '',
      event: json['event'] ?? '',
    );
  }

  String get formattedDate => '$day/$month/$year';
}
