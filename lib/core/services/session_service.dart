import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../network/api_client.dart';
import '../network/endpoints.dart';

class SessionService {
  static SharedPreferences? _prefs;
  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }
  static const String _tokenKey = 'auth_token';
  static const String _onboardingKey = 'onboarding_completed';
  static Future<String?> getAuthToken() async {
    if (_prefs == null) await init();
    final token = _prefs!.getString(_tokenKey);
    return token;
  }

  static Future<void> setAuthToken(String token) async {
    if (_prefs == null) await init();
    final result = await _prefs!.setString(_tokenKey, token);
  }

  static Future<void> clearAuthToken() async {
    if (_prefs == null) await init();
    await _prefs!.remove(_tokenKey);
  }
  static Future<bool> hasStoredToken() async {
    final token = await getAuthToken();
    return token != null && token.isNotEmpty;
  }
  static Future<bool> isOnboardingCompleted() async {
    if (_prefs == null) await init();
    final completed = _prefs!.getBool(_onboardingKey) ?? false;
    return completed;
  }

  static Future<void> markOnboardingCompleted() async {
    if (_prefs == null) await init();
    final result = await _prefs!.setBool(_onboardingKey, true);
  }

  static Future<void> resetOnboarding() async {
    if (_prefs == null) await init();
    await _prefs!.setBool(_onboardingKey, false);
  }
  static Future<bool> validateToken() async {
    final token = await getAuthToken();
    if (token == null || token.isEmpty) {
      return false;
    }

    try {
      final apiClient = ApiClient(Dio());
      final response = await apiClient.get(
        Endpoints.profile,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );
      return true;
    } catch (e) {
      await clearAuthToken();
      return false;
    }
  }
  static Future<AppLaunchState> getAppLaunchState() async {
    final token = await getAuthToken();
    if (token != null && token.isNotEmpty) {
      return AppLaunchState.authenticated;
    }

    final onboardingCompleted = await isOnboardingCompleted();

    if (onboardingCompleted) {
      return AppLaunchState.needsAuth;
    } else {
      return AppLaunchState.needsOnboarding;
    }
  }
}

enum AppLaunchState {
  authenticated,    
  needsAuth,        
  needsOnboarding,  
}
