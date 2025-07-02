import 'package:appnetflix/core/api/api_url.dart';
import 'package:appnetflix/data/list_movie_model.dart';
import 'package:appnetflix/logic/top_rated_bloc/states.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopRatedCubit extends Cubit<TopRatedStates> {
  TopRatedCubit() : super(TopRatedInitailState());

  final dio = Dio();
  
  
  Future getTopRatedMovies() async {
    emit(TopRatedLoadingState());
    try {
      final response = await dio.get(ApiUrl.topRatedUrl);
      final y = MovieModelResponse.fromJson(response.data);
      emit(TopRatedSuccessState(movieModelResponse: y));
    } catch (e) {
      emit(TopRatedErrorState(em: e.toString()));
    }
  }
}
