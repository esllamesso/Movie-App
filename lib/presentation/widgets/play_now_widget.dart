import 'package:appnetflix/core/utils/colors.dart';
import 'package:appnetflix/core/utils/txt.dart';
import 'package:appnetflix/logic/now_playing_bloc/cubit.dart';
import 'package:appnetflix/logic/now_playing_bloc/states.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../screens/details_screen.dart';

class PlayNowWidget extends StatelessWidget {
  const PlayNowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NowPlayingCubit, NowPlayingStates>(
      builder: (context, state) {
        if (state is NowPlayingLoadingState) {
          return Center(child: Lottie.asset('assets/animations/loading_animation.json', width: 55, height: 55));
        } else if (state is NowPlayingSuccessState) {
          final movies = state.movieModelResponse.results ?? [];

          return Stack(
            children: [
              SizedBox(
                height: 370,
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: 370,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    viewportFraction: 1.0,
                    autoPlayInterval: const Duration(seconds: 3),
                    autoPlayAnimationDuration: const Duration(
                      milliseconds: 800,
                    ),
                  ),
                  items: movies.map((movie) {
                    return Builder(
                      builder: (BuildContext context) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      DetailsScreen(movie: movie),
                                ),
                              );
                            },
                            child: Image.network(
                              'https://image.tmdb.org/t/p/w500${movie.backdropPath ?? movie.posterPath}',
                              width: MediaQuery.of(context).size.width,
                              height: 370,
                              fit: BoxFit.fill,
                              errorBuilder: (context, error, stackTrace) =>
                                  const Icon(Icons.error),
                            ),
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 300, left: 125),
                child: Row(
                  children: [
                    SizedBox(
                      width: 15,
                      height: 15,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: ColorsManager.red,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(100),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      Txt.nowPlaying,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w300,
                        color: ColorsManager.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        } else if (state is NowPlayingErrorState) {
          return Center(child: Text("Error: ${state.em}"));
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
