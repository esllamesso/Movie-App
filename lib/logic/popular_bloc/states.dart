import 'package:appnetflix/data/list_movie_model.dart';

class PopularStates {}

class PopularInitailState extends PopularStates {}

class PopularLoadingState extends PopularStates {}

class PopularSuccessState extends PopularStates {
  final MovieModelResponse movieModelResponse;
  PopularSuccessState({required this.movieModelResponse});
}

class PopularErrorState extends PopularStates {
  final String em;
  PopularErrorState({required this.em});
}