import 'dart:io';

class HasInternetConnection {
  static Future<bool> hasInternet() async {
    try {
      final result = await InternetAddress.lookup('google.com').timeout(const Duration(seconds: 3));
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
    } on SocketException catch (_) {
    } on Exception catch (_) {
      return false;
    }
    return false;
  }
}
