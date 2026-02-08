import 'package:history_simple_app/database/app_database.dart' as db;
import 'package:history_simple_app/feature/history/data/models/random_fact.dart';

class RandomFactMapper {
  static RandomFact mapDpDataToModel(db.RandomFactTableData dbData) {
    return RandomFact(
      dbData.fact,
      id: dbData.id,
    );
  }
}
