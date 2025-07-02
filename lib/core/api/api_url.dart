class ApiUrl{
  static const String baseUrl = "https://api.themoviedb.org/3/";
  static const String apiKey = "87903828b97a85b50c60fb3bbd960c55";
  static const String nowPlayingUrl = "${baseUrl}movie/now_playing?api_key=$apiKey";
  static const String popularUrl = "${baseUrl}movie/popular?api_key=$apiKey";
  static const String topRatedUrl = "${baseUrl}movie/top_rated?api_key=$apiKey";


}