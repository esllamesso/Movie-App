import 'movie_model.dart';

class MovieModelResponse {
  int? page;
  List<MovieModel>? results;
  int? totalPages;
  int? totalResults;

  MovieModelResponse({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  MovieModelResponse.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    results = (json['results'] as List?)
        ?.map((v) => MovieModel.fromJson(v))
        .toList();
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }
}
