import 'package:appnetflix/core/utils/colors.dart';
import 'package:appnetflix/core/utils/txt.dart';
import 'package:appnetflix/logic/now_playing_bloc/cubit.dart';
import 'package:appnetflix/presentation/widgets/nav_bar.dart';
import 'package:appnetflix/presentation/widgets/play_now_widget.dart';
import 'package:appnetflix/presentation/widgets/popular_movies_widget.dart';
import 'package:appnetflix/presentation/widgets/top_rated_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import '../../logic/popular_bloc/cubit.dart';
import '../../logic/popular_bloc/states.dart';
import '../../logic/top_rated_bloc/cubit.dart';
import '../../logic/top_rated_bloc/states.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => NowPlayingCubit()..grtNowPlayingMovie()),
        BlocProvider(create: (context) => PopularCubit()..getPopularMovies()),
        BlocProvider(create: (context) => TopRatedCubit()..getTopRatedMovies()),

      ],
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(children: [PlayNowWidget()]),
            SizedBox(height: 9),
            Padding(
              padding: const EdgeInsets.only(left: 14),
              child: Text(
                Txt.popular,
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.w700,
                  color: ColorsManager.white,
                ),
              ),
            ),
            SizedBox(height: 5),
            BlocBuilder<PopularCubit, PopularStates>(
              builder: (context, state) {
                if (state is PopularLoadingState) {
                  return Center(
                    child: Lottie.asset(
                      'assets/animations/loading_animation.json',
                      width: 55,
                      height: 55,
                    ),
                  );
                } else if (state is PopularSuccessState) {
                  return PopularMoviesWidget(
                    movies: state.movieModelResponse.results ?? [],
                  );
                } else if (state is PopularErrorState) {
                  return Center(
                    child: Text(
                      "Error: ${state.em}",
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
            SizedBox(height: 9),
            Padding(
              padding: const EdgeInsets.only(left: 14),
              child: Text(
                Txt.topRated,
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.w700,
                  color: ColorsManager.white,
                ),
              ),
            ),
            SizedBox(height: 5),
            BlocBuilder<TopRatedCubit, TopRatedStates>(
              builder: (context, state) {
                if (state is TopRatedLoadingState) {
                  return Center(
                    child: Lottie.asset(
                      'assets/animations/loading_animation.json',
                      width: 55,
                      height: 55,
                    ),
                  );
                } else if (state is TopRatedSuccessState) {
                  return TopRatedWidget(
                    movies: state.movieModelResponse.results ?? [],
                  );
                } else if (state is TopRatedErrorState) {
                  return Center(
                    child: Text(
                      "Error: ${state.em}",
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
