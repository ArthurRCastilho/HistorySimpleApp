import 'package:dio/dio.dart';
import 'package:history_simple_app/feature/history/data/models/history_event.dart';
import 'package:history_simple_app/feature/history/data/models/random_fact.dart';
import 'package:history_simple_app/core/utils/utils/loggy.dart';
import 'package:history_simple_app/feature/history/data/services/services.dart';

class HistoryRepository with HistoryRepositoryLoggy {
  final HistoryServiceRemote _serviceRemote;
  final HistoryServiceLocal _serviceLocal;

  HistoryRepository({
    required HistoryServiceRemote historyServiceRemote,
    required HistoryServiceLocal historyServiceLocal,
  }) : _serviceRemote = historyServiceRemote,
       _serviceLocal = historyServiceLocal;

  Future<void> saveSearch(String year) async {
    await _serviceLocal.saveSearch(year);
  }

  Future<List<String>> getRecentSearches() async {
    return await _serviceLocal.getRecentSearches();
  }

  Future<void> clearSearchHistory() async {
    await _serviceLocal.clearSearchHistory();
  }

  Future<List<HistoryEvent>?> getHistory(String year) async {
    try {
      final response = await _serviceRemote.fetchHistoryByYear(year);
      if (response.statusCode == 200) {
        final List<dynamic> body = response.data;
        if (body.isNotEmpty) {
          final List<HistoryEvent> listHistories = [];
          for (final eventData in body) {
            final historyEvent = HistoryEvent.fromJson(eventData);
            listHistories.add(historyEvent);
          }
          return listHistories;
        }
      } else {
        final body = response.data ?? response;
        loggy.warning('Status code diferente de 200: ${response.statusCode} \n $body');
        return null;
      }
    } on DioException catch (e) {
      loggy.error('Erro ao buscar na API: ${e.message ?? e.toString()}');
      return null;
    }
    return null;
  }

  Future<String?> getRandomHistoryFact() async {
    try {
      final response = await _serviceRemote.fetchRandowHistoryFact();
      if (response.statusCode == 200) {
        final List<dynamic> body = response.data;

        if (body.isNotEmpty) {
          final json = body[0];
          final fact = RandomFact.fromMap(json);
          return fact.fact;
        }

        return 'Nenhum fato encontrado';
      }
      return 'Erro inesperado';
    } on DioException catch (e) {
      loggy.error('Erro ao buscar na API: ${e.message ?? e.toString()}');
      return 'Erro ao consultar na API';
    }
  }
}
