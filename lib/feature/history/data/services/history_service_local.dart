import 'package:history_simple_app/database/daos/history_event_dao.dart';
import 'package:history_simple_app/database/daos/random_facts_dao.dart';
import 'package:history_simple_app/database/daos/search_history_dao.dart';
import 'package:history_simple_app/feature/history/data/mappers/mappers.dart';
import 'package:history_simple_app/feature/history/data/models/history_event.dart';
import 'package:history_simple_app/feature/history/data/models/random_fact.dart';

class HistoryServiceLocal {
  final HistoryEventDao _historyEventDao;
  final RandomFactsDao _randomFactsDao;
  final SearchHistoryDao _searchHistoryDao;

  HistoryServiceLocal({
    required HistoryEventDao historyEventDao,
    required RandomFactsDao randomFactsDao,
    required SearchHistoryDao searchHistoryDao,
  }) : _historyEventDao = historyEventDao,
       _randomFactsDao = randomFactsDao,
       _searchHistoryDao = searchHistoryDao;

  Future<void> saveSearch(String query) async {
    await _searchHistoryDao.insertNewSearch(query);
  }

  Future<List<String>> getRecentSearches() async {
    return await _searchHistoryDao.readRecentSearches(limit: 20);
  }

  Future<void> clearSearchHistory() async {
    await _searchHistoryDao.deleteAll();
  }

  Future<int> insertHistory(HistoryEvent history) async {
    return await _historyEventDao.insertHistoryEvent(history);
  }

  Future<List<HistoryEvent>> readHistories() async {
    final data = await _historyEventDao.readHistoryEvents();
    final events = data.map((d) => HistoryEventMapper.mapDpDataToModel(d)).toList();
    return events;
  }

  Future<int> insertRandomFacts(RandomFact fact) async {
    return await _randomFactsDao.insertRandomFact(fact);
  }

  Future<List<RandomFact>> readRandomFacts() async {
    final data = await _randomFactsDao.readRandomFacts();
    final facts = data.map((f) => RandomFactMapper.mapDpDataToModel(f)).toList();
    return facts;
  }
}
