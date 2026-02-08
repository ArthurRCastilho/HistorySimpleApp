import 'package:drift/drift.dart';

class HistoryEventTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get yearh => text()();
  TextColumn get month => text()();
  TextColumn get day => text()();
  TextColumn get event => text()();
}
