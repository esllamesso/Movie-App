import 'package:appnetflix/data/list_movie_model.dart';

class TopRatedStates {}

class TopRatedInitailState extends TopRatedStates {}

class TopRatedLoadingState extends TopRatedStates {}

class TopRatedSuccessState extends TopRatedStates {
  final MovieModelResponse movieModelResponse;
  TopRatedSuccessState({required this.movieModelResponse});
}

class TopRatedErrorState extends TopRatedStates {
  final String em;
  TopRatedErrorState({required this.em});
}