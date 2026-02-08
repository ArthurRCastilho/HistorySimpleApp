import 'package:history_simple_app/database/app_database.dart' as db;
import 'package:history_simple_app/feature/history/data/models/history_event.dart';

class HistoryEventMapper {
  static HistoryEvent mapDpDataToModel(db.HistoryEventTableData dbData) {
    return HistoryEvent(
      id: dbData.id,
      year: dbData.yearh,
      month: dbData.month,
      day: dbData.day,
      event: dbData.event,
    );
  }
}
