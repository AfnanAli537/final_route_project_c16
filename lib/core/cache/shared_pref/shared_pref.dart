import 'package:shared_preferences/shared_preferences.dart';
class SharedPref {
  static  late SharedPreferences _prefs;

 static Future<void> init() async {
   _prefs = await SharedPreferences.getInstance();
}

 static  Future clear() async {
    await _prefs.clear();
  }


}

