import 'package:connectivity_plus/connectivity_plus.dart';


class NetworkChecker {
  static Future<bool> hasInternet() async {
       try {
      final result = await Connectivity().checkConnectivity();
      return result != ConnectivityResult.none;
    } catch (_) {
      return false;
    }
  }

}
