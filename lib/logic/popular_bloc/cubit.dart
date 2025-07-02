import 'package:appnetflix/core/api/api_url.dart';
import 'package:appnetflix/data/list_movie_model.dart';
import 'package:appnetflix/logic/popular_bloc/states.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PopularCubit extends Cubit<PopularStates> {
  PopularCubit() : super (PopularInitailState());
  final dio = Dio();

  Future getPopularMovies() async{
    emit(PopularLoadingState());
    try{

      final response = await dio.get(ApiUrl.popularUrl);
      final y = MovieModelResponse.fromJson(response.data);
      emit(PopularSuccessState(movieModelResponse: y));


    }catch(e){
      emit(PopularErrorState(em: e.toString()));
    }
  }
}