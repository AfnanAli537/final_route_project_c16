import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../network/api_client.dart';
import '../network/endpoints.dart';

class SessionService {
  static SharedPreferences? _prefs;

  // Initialize SharedPreferences
  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
    print('SessionService initialized with SharedPreferences');
  }
  static const String _tokenKey = 'auth_token';
  static const String _onboardingKey = 'onboarding_completed';

  // Remove static caching - rely on SharedPreferences directly
  // Static variables are lost on app restart

  // Auth Token Management
  static Future<String?> getAuthToken() async {
    if (_prefs == null) await init();
    print('Reading token from SharedPreferences...');
    final token = _prefs!.getString(_tokenKey);
    print('Token from SharedPreferences: ${token != null ? token.substring(0, 20) + "..." : "null"}');
    return token;
  }

  static Future<void> setAuthToken(String token) async {
    if (_prefs == null) await init();
    print('SessionService.setAuthToken called with token: ${token.substring(0, 20)}...');
    final result = await _prefs!.setString(_tokenKey, token);
    print('Token saved to SharedPreferences: $result');
  }

  static Future<void> clearAuthToken() async {
    if (_prefs == null) await init();
    print('Clearing auth token from SharedPreferences...');
    await _prefs!.remove(_tokenKey);
    print('Token cleared');
  }

  // Check if user has a stored token (without validation)
  static Future<bool> hasStoredToken() async {
    final token = await getAuthToken();
    return token != null && token.isNotEmpty;
  }

  // Onboarding Status Management
  static Future<bool> isOnboardingCompleted() async {
    if (_prefs == null) await init();
    print('Reading onboarding status from SharedPreferences...');
    final completed = _prefs!.getBool(_onboardingKey) ?? false;
    print('Onboarding status from SharedPreferences: $completed');
    return completed;
  }

  static Future<void> markOnboardingCompleted() async {
    if (_prefs == null) await init();
    print('SessionService.markOnboardingCompleted called');
    final result = await _prefs!.setBool(_onboardingKey, true);
    print('Onboarding status saved to SharedPreferences: $result');
  }

  static Future<void> resetOnboarding() async {
    if (_prefs == null) await init();
    print('Resetting onboarding status...');
    await _prefs!.setBool(_onboardingKey, false);
    print('Onboarding status reset');
  }

  // Validate token with API
  static Future<bool> validateToken() async {
    final token = await getAuthToken();
    if (token == null || token.isEmpty) {
      print('No token to validate');
      return false;
    }

    try {
      print('Validating token with API call...');
      // Try to make a simple API call to validate token
      final apiClient = ApiClient();
      final response = await apiClient.dio.get(
        EndPoints.profile,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );
      print('Token validation successful, status: ${response.statusCode}');
      return true;
    } catch (e) {
      print('Token validation failed: $e');
      // Token is invalid, clear it
      await clearAuthToken();
      return false;
    }
  }

  // Combined App State Check
  static Future<AppLaunchState> getAppLaunchState() async {
    print('=== Checking App Launch State ===');

    // First check if we have a token
    final token = await getAuthToken();

    if (token != null && token.isNotEmpty) {
      print('✅ Valid token found, user should be authenticated');
      // For now, if we have any stored token, consider user authenticated
      // We can add token validation later if needed, but this prevents login loops
      return AppLaunchState.authenticated;
    }

    print('❌ No stored token found');

    // If no token, check onboarding status
    final onboardingCompleted = await isOnboardingCompleted();

    if (onboardingCompleted) {
      print('✅ Onboarding completed, user needs to login');
      return AppLaunchState.needsAuth;
    } else {
      print('🆕 First time user, needs onboarding');
      return AppLaunchState.needsOnboarding;
    }
  }
}

enum AppLaunchState {
  authenticated,    // User has token, go to home
  needsAuth,        // Onboarding done, needs login/register
  needsOnboarding,  // First time user, show onboarding
}
