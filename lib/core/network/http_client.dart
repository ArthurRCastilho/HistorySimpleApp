import 'package:dio/dio.dart';
import 'package:history_simple_app/env.dart';

class HttpClient {
  late final Dio dio;
  HttpClient() {
    dio = Dio(
      BaseOptions(
        baseUrl: Env.baseUrl,
        connectTimeout: const Duration(seconds: 20),
        receiveTimeout: const Duration(seconds: 20),
        responseType: ResponseType.json,
        headers: {'X-Api-Key': Env.ninjaApiKey},
      ),
    );
  }
}
