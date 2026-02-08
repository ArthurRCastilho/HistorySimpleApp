import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env/app.env', obfuscate: true)
abstract class Env {
  @EnviedField(varName: 'BASE_URL')
  static final String baseUrl = _Env.baseUrl;

  @EnviedField(varName: 'API_NINJAS_KEY')
  static final String ninjaApiKey = _Env.ninjaApiKey;
}
