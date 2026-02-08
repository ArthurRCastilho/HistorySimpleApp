import 'package:drift/drift.dart';

class SearchHistoryTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get query => text().withLength(min: 1, max: 10)();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  @override
  List<Set<Column>> get uniqueKeys => [
    {query},
  ];
}
