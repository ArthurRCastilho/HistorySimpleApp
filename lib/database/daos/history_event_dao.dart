import 'package:drift/drift.dart';
import 'package:history_simple_app/database/app_database.dart' as db;
import 'package:history_simple_app/feature/history/data/models/history_event.dart';

class HistoryEventDao {
  final db.AppDatabase _database;

  HistoryEventDao({required db.AppDatabase database}) : _database = database;

  Future<int> insertHistoryEvent(HistoryEvent history) async {
    return await _database
        .into(_database.historyEventTable)
        .insert(
          db.HistoryEventTableCompanion.insert(
            yearh: history.year,
            month: history.month,
            day: history.day,
            event: history.event,
          ),
        );
  }

  Future<List<db.HistoryEventTableData>> readHistoryEvents({int limit = 5}) async {
    final events =
        await (_database.select(_database.historyEventTable)
              ..orderBy([(t) => OrderingTerm(expression: t.id, mode: OrderingMode.desc)])
              ..limit(limit))
            .get();
    return events;
  }
}
