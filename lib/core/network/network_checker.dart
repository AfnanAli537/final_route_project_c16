
// class NetworkChecker {

//   static Future<bool> hasInternetConnection() async {
//     try {
//       final result = await InternetAddress.lookup('google.com');
//       if (result.isNotEmpty && result.first.rawAddress.isNotEmpty) {
//         return true;
//       }
//       return false;
//     } on SocketException catch (_) {
//       return false;
//     } catch (_) {
//       return false;
//     }
//   }
// }
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

// class NetworkChecker {
//   static Future<bool> hasInternet() async {
//     final result = await Connectivity().checkConnectivity();
//     return result != ConnectivityResult.none;
//   }
// }


class NetworkChecker {
  static Future<bool> hasInternet() async {
       try {
      final result = await Connectivity().checkConnectivity();
      return result != ConnectivityResult.none;
    } catch (_) {
      return false;
    }
  }
  //   final connectivityResult = await Connectivity().checkConnectivity();
  //   if (connectivityResult == ConnectivityResult.none) return false;

  //   // Actually check internet
  //   return await  InternetConnection().hasInternetAccess;
  // }
}
