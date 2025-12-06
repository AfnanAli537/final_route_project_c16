import 'package:dio/dio.dart';
import '../network/api_client.dart';

class SessionService {
  static String? _authToken;
  static bool _onboardingCompleted = false;

  // Auth Token Management
  static String? getAuthToken() => _authToken;

  static void setAuthToken(String token) {
    _authToken = token;
  }

  static void clearAuthToken() {
    _authToken = null;
  }

  // Onboarding Status Management
  static bool isOnboardingCompleted() => _onboardingCompleted;

  static void markOnboardingCompleted() {
    _onboardingCompleted = true;
  }

  static void resetOnboarding() {
    _onboardingCompleted = false;
  }

  // Validate token with API
  static Future<bool> validateToken() async {
    if (_authToken == null) return false;

    try {
      // Try to make a simple API call to validate token
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
      // Token is invalid, clear it
      clearAuthToken();
      return false;
    }
  }

  // Combined App State Check
  static Future<AppLaunchState> getAppLaunchState() async {
    // First check if we have a token in memory
    if (_authToken != null && _authToken!.isNotEmpty) {
      // Validate token with API
      final isValid = await validateToken();
      if (isValid) {
        return AppLaunchState.authenticated;
      }
    }

    // If no valid token, check onboarding status
    if (_onboardingCompleted) {
      return AppLaunchState.needsAuth;
    } else {
      return AppLaunchState.needsOnboarding;
    }
  }
}

enum AppLaunchState {
  authenticated,    // User has token, go to home
  needsAuth,        // Onboarding done, needs login/register
  needsOnboarding,  // First time user, show onboarding
}
