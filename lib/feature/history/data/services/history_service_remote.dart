import 'package:dio/dio.dart';

class HistoryServiceRemote {
  final Dio dio;

  HistoryServiceRemote(this.dio);

  Future<Response> fetchHistoryByYear(String year) async {
    return dio.get('/historicalevents?year=$year');
  }

  Future<Response> fetchRandowHistoryFact() async {
    return dio.get('/facts');
  }
}
