import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:history_simple_app/core/network/http_client.dart';
import 'package:history_simple_app/database/app_database.dart';
import 'package:history_simple_app/database/daos/daos.dart';
import 'package:history_simple_app/feature/history/data/repositories/repositories.dart';
import 'package:history_simple_app/feature/history/data/services/services.dart';
import 'package:history_simple_app/feature/history/ui/pages/pages.dart';

final getIt = GetIt.instance;

void setupInjection() {
  /// ==========================
  /// Core / Infra / Database
  /// ==========================
  getIt.registerLazySingleton<HttpClient>(
    () => HttpClient(),
  );
  getIt.registerLazySingleton<Dio>(
    () => HttpClient().dio,
  );
  getIt.registerSingleton<AppDatabase>(AppDatabase());

  /// ==========================
  /// DAOs
  /// ==========================
  getIt.registerLazySingleton<HistoryEventDao>(
    () => HistoryEventDao(database: getIt<AppDatabase>()),
  );
  getIt.registerLazySingleton<RandomFactsDao>(
    () => RandomFactsDao(database: getIt<AppDatabase>()),
  );
  getIt.registerLazySingleton<SearchHistoryDao>(
    () => SearchHistoryDao(database: getIt<AppDatabase>()),
  );

  /// ==========================
  /// Services
  /// ==========================
  getIt.registerLazySingleton<HistoryServiceRemote>(
    () => HistoryServiceRemote(
      getIt<Dio>(),
    ),
  );
  getIt.registerLazySingleton<HistoryServiceLocal>(
    () => HistoryServiceLocal(
      historyEventDao: getIt<HistoryEventDao>(),
      randomFactsDao: getIt<RandomFactsDao>(),
      searchHistoryDao: getIt<SearchHistoryDao>(),
    ),
  );

  /// ==========================
  /// Repositories
  /// ==========================
  getIt.registerLazySingleton<HistoryRepository>(
    () => HistoryRepository(
      historyServiceRemote: getIt<HistoryServiceRemote>(),
      historyServiceLocal: getIt<HistoryServiceLocal>(),
    ),
  );

  /// ==========================
  /// ViewModels / Blocs
  /// ==========================
  getIt.registerFactory<HomeViewModel>(
    () => HomeViewModel(
      historyRepository: getIt<HistoryRepository>(),
    ),
  );
  getIt.registerFactory<ResultsViewModel>(
    () => ResultsViewModel(
      historyRepository: getIt<HistoryRepository>(),
    ),
  );
}
