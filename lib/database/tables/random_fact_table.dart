import 'package:drift/drift.dart';

class RandomFactTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get fact => text()();

  @override
  List<Set<Column>> get uniqueKeys => [
    {fact},
  ];
}
