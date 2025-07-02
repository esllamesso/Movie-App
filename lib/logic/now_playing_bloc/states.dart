import 'package:appnetflix/data/list_movie_model.dart';

class NowPlayingStates {}

class NowPlayingInitailState extends NowPlayingStates {}

class NowPlayingLoadingState extends NowPlayingStates {}

class NowPlayingSuccessState extends NowPlayingStates {
  final MovieModelResponse movieModelResponse;
  NowPlayingSuccessState({required this.movieModelResponse});
}

class NowPlayingErrorState extends NowPlayingStates {
  final String em;
  NowPlayingErrorState({required this.em});
}