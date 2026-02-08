import 'package:drift/drift.dart';
import 'package:history_simple_app/database/app_database.dart' as db;

class SearchHistoryDao {
  final db.AppDatabase _database;
  SearchHistoryDao({required db.AppDatabase database}) : _database = database;

  Future<int> insertNewSearch(String query) async {
    return await _database
        .into(_database.searchHistoryTable)
        .insert(
          db.SearchHistoryTableCompanion.insert(query: query),
          mode: InsertMode.insertOrIgnore,
        );
  }

  Future<List<String>> readRecentSearches({int limit = 20}) async {
    final query = _database.select(_database.searchHistoryTable)
      ..orderBy([(t) => OrderingTerm(expression: t.createdAt, mode: OrderingMode.desc)])
      ..limit(limit);

    final results = await query.get();
    return results.map((row) => row.query).toList();
  }

  Future<void> deleteAll() async {
    await _database.delete(_database.searchHistoryTable).go();
  }
}
