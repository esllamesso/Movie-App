class ApiUrl{
  static const String baseUrl = "https://api.themoviedb.org/3/";
  // TMDB API key, passed at build time:
  //   flutter run --dart-define=TMDB_API_KEY=your_key
  static const String apiKey = String.fromEnvironment('TMDB_API_KEY');
  static const String nowPlayingUrl = "${baseUrl}movie/now_playing?api_key=$apiKey";
  static const String popularUrl = "${baseUrl}movie/popular?api_key=$apiKey";
  static const String topRatedUrl = "${baseUrl}movie/top_rated?api_key=$apiKey";


}