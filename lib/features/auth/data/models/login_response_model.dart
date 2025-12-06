class LoginResponseModel {
  final String message;
  final String token;

  LoginResponseModel({
    required this.message,
    required this.token,
  });

  factory LoginResponseModel.fromJson(dynamic json) {
    if (json is Map<String, dynamic>) {
      return LoginResponseModel(
        message: json['message']?.toString() ?? '',
        token: json['data']?.toString() ?? '',
      );
    } else if (json is String) {
      // If response is just a string, treat it as token
      return LoginResponseModel(
        message: 'Login successful',
        token: json,
      );
    } else {
      throw Exception('Unexpected response format: $json');
    }
  }
}
