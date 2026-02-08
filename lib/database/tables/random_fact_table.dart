import 'package:drift/drift.dart';

class RandomFactTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get fact => text()();
}
