class RandomFact {
  final int? id;
  final String fact;
  RandomFact(this.fact, {this.id});

  factory RandomFact.fromMap(Map<String, dynamic> json) {
    return RandomFact(json['fact'] as String);
  }
}
