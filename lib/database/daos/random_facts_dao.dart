import 'package:drift/drift.dart';
import 'package:history_simple_app/database/app_database.dart' as db;
import 'package:history_simple_app/feature/history/data/models/random_fact.dart';

class RandomFactsDao {
  final db.AppDatabase _database;

  RandomFactsDao({required db.AppDatabase database}) : _database = database;

  Future<int> insertRandomFact(RandomFact fact) async {
    return await _database
        .into(_database.randomFactTable)
        .insert(
          db.RandomFactTableCompanion.insert(
            fact: fact.fact,
          ),
          mode: InsertMode.insertOrIgnore,
        );
  }

  Future<List<db.RandomFactTableData>> readRandomFacts({int limit = 5}) async {
    final facts =
        await (_database.select(_database.randomFactTable)
              ..orderBy([(t) => OrderingTerm(expression: t.id, mode: OrderingMode.desc)])
              ..limit(limit))
            .get();

    return facts;
  }
}
