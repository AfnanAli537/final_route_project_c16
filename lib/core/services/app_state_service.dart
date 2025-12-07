import 'package:dio/dio.dart';
import '../network/api_client.dart';

class SessionService {
  static String? _authToken;
  static bool _onboardingCompleted = false;

  static String? getAuthToken() => _authToken;

  static void setAuthToken(String token) {
    _authToken = token;
  }

  static void clearAuthToken() {
    _authToken = null;
  }

  static bool isOnboardingCompleted() => _onboardingCompleted;

  static void markOnboardingCompleted() {
    _onboardingCompleted = true;
  }

  static void resetOnboarding() {
    _onboardingCompleted = false;
  }

  static Future<bool> validateToken() async {
    if (_authToken == null) return false;

    try {
      final apiClient = ApiClient(Dio());
      await apiClient.get(
        'profile',
        options: Options(
          headers: {
            'Authorization': 'Bearer $_authToken',
          },
        ),
      );
      return true;
    } catch (e) {
      clearAuthToken();
      return false;
    }
  }
  static Future<AppLaunchState> getAppLaunchState() async {
    if (_authToken != null && _authToken!.isNotEmpty) {
      final isValid = await validateToken();
      if (isValid) {
        return AppLaunchState.authenticated;
      }
    }
    if (_onboardingCompleted) {
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
