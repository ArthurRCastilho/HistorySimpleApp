import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:history_simple_app/core/network/has_internet_connection.dart';
import 'package:history_simple_app/core/utils/utils/loggy.dart';
import 'package:history_simple_app/feature/history/ui/pages/history_details/view_model/history_details_state.dart';

class HistoryDetailsViewModel extends Cubit<HistoryDetailsState> with HistoryDetailsViewlModelLoggy {
  HistoryDetailsViewModel() : super(HistoryDetailsState(isOnline: false)) {
    _init();
  }

  Future<void> _init() async {
    final bool online = await HasInternetConnection.hasInternet();
    emit(state.copyWith(isOnline: online));
  }

  @override
  Future<void> close() {
    emit(state.copyWith(isOnline: false));
    return super.close();
  }
}
