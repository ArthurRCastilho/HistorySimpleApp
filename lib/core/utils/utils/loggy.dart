import 'package:loggy/loggy.dart';

mixin HomeViewModelLoggy implements LoggyType {
  @override
  Loggy<HomeViewModelLoggy> get loggy => Loggy<HomeViewModelLoggy>('Home ViewModel Loggy - $runtimeType');
}

mixin ResultsViewModelLoggy implements LoggyType {
  @override
  Loggy<ResultsViewModelLoggy> get loggy => Loggy<ResultsViewModelLoggy>('Results ViewModel Loggy - $runtimeType');
}

mixin HistoryDetailsViewlModelLoggy implements LoggyType {
  @override
  Loggy<HistoryDetailsViewlModelLoggy> get loggy => Loggy<HistoryDetailsViewlModelLoggy>('History Details ViewModel Loggy - $runtimeType');
}

mixin HistoryRepositoryLoggy implements LoggyType {
  @override
  Loggy<HistoryRepositoryLoggy> get loggy => Loggy<HistoryRepositoryLoggy>('History Repository Loggy - $runtimeType');
}

mixin HistoryServiceRemoteLoggy implements LoggyType {
  @override
  Loggy<HistoryServiceRemoteLoggy> get loggy => Loggy<HistoryServiceRemoteLoggy>('History Service Remote Loggy - $runtimeType');
}
