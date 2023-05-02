import 'package:flutter/material.dart';

import 'package:movielist/controller/movielist_provider.dart';
import 'package:movielist/view/listscreen/widgets/movie_container.dart';
import 'package:provider/provider.dart';

class ListMovieScreen extends StatelessWidget {
  const ListMovieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Consumer<MovieListProvider>(
        builder: (context, movieListProvider, child) {
          if (movieListProvider.movieList.isEmpty) {
            return const Center(
              child: Text("Movie list is empty"),
            );
          }
          return GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 1 / 1.4,
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              children:
                  List.generate(movieListProvider.movieList.length, (index) {
                final movieData = movieListProvider.movieList[index];
                return MovieContainer(
                  movieData: movieData,
                  index: index,
                );
              }));
        },
      ),
    );
  }
}
