import 'package:appnetflix/data/movie_model.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import '../widgets/image_list_view.dart';
import '../widgets/nav_bar.dart';

class DetailsScreen extends StatelessWidget {
  final MovieModel movie;

  const DetailsScreen({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.network(
                  'https://image.tmdb.org/t/p/w500${movie.backdropPath ?? movie.posterPath}',
                  width: double.infinity,
                  height: 287,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  left: 15,
                  top: 30,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 35),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title ?? "No title",
                    style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.star, size: 16, color: Colors.grey),
                      Text(
                        "${movie.voteAverage?.toStringAsFixed(1) ?? "N/A"} (IMDb)",
                        style: const TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                  const SizedBox(height: 19),
                  const Divider(color: Colors.grey),
                  const SizedBox(height: 19),
                  Text(
                    "Genre: ${movie.genreIds?.join(', ') ?? "N/A"}",
                    style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 19),
                  const Divider(color: Colors.grey),
                  const SizedBox(height: 19),
                  const Text(
                    "Description",
                    style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 15),
                  ReadMoreText(
                    movie.overview ?? "No description available.",
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: "Read More",
                    trimExpandedText: "Read Less",
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                    moreStyle: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
                    lessStyle: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 19),
                  const Text(
                    "Related Movies",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
                  ),
                  const SizedBox(height: 26),
                ],
              ),
            ),
            ImageListView(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
