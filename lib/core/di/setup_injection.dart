import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:history_simple_app/feature/history/ui/pages/home/view_model/home_view_model.dart';

final getIt = GetIt.instance;

void setupInjection() {
  /// ==========================
  /// Core / Infra
  /// ==========================
  getIt.registerLazySingleton<Dio>(
    () => Dio(),
  );

  /// ==========================
  /// ViewModels / Blocs
  /// ==========================
  getIt.registerFactory<HomeViewModel>(() => HomeViewModel());
}
