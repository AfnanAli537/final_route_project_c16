class Endpoints {
  static const String authBaseUrl = "https://route-movie-apis.vercel.app/";
  static const String moviesBaseUrl = "https://yts.lt/api/v2";
  static const String listMovies = "/list_movies.json";
  static const String browser = "/list_movies.json?limit=50";
  static const String login = "auth/login";
  static const String register = "auth/register";
  static const String resetPassword = "auth/reset-password";
  static const String profile = "profile";
  static const String details = "/movie_details.json";
  static const String movieSuggestions = "/movie_suggestions.json";
}
