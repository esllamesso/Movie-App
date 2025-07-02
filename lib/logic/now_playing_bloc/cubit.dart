import 'package:appnetflix/core/api/api_url.dart';
import 'package:appnetflix/data/list_movie_model.dart';
import 'package:appnetflix/logic/now_playing_bloc/states.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NowPlayingCubit extends Cubit<NowPlayingStates> {
  NowPlayingCubit() : super(NowPlayingStates());

  final dio = Dio();

  ///
  Future grtNowPlayingMovie() async {
    emit(NowPlayingLoadingState());
    try {
      final response = await dio.get(ApiUrl.nowPlayingUrl);

      final x = MovieModelResponse.fromJson(response.data);
      emit(NowPlayingSuccessState(movieModelResponse: x));
    } catch (e) {
      emit(NowPlayingErrorState(em: e.toString()));
    }
  }
}
