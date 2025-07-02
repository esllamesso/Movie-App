import 'package:appnetflix/data/movie_model.dart';
import 'package:appnetflix/presentation/screens/details_screen.dart';
import 'package:flutter/material.dart';

class PopularMoviesWidget extends StatelessWidget {
  final List<MovieModel> movies;

  const PopularMoviesWidget({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 168,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final movie = movies[index];
          final imageUrl =
              'https://image.tmdb.org/t/p/w500${movie.backdropPath ?? movie.posterPath}';
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 6),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsScreen(
                        movie: movies[index],
                      ),
                    ),
                  );
                },
                child: Image.network(
                  imageUrl,
                  width: 120,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.error),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
