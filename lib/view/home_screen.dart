import 'package:flutter/material.dart';
import 'package:movielist/controller/movielist_provider.dart';
import 'package:movielist/view/add_movie_screen.dart';
import 'package:movielist/view/widgets/const_colors.dart';
import 'package:movielist/view/widgets/core_widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Consumer<MovieListProvider>(
            builder: (context, movieListProvider, child) {
              if (movieListProvider.movieList.isEmpty) {
                return const Center(
                  child: Text("Movie list is empty"),
                );
              }
              return ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                itemCount: movieListProvider.movieList.length,
                itemBuilder: (context, index) {
                  final movieData = movieListProvider.movieList[index];
                  return ListTile(
                    title: Text(movieData.title),
                    trailing: IconButton(
                        onPressed: () {
                          deleteMovieButton(index, context);
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: kRedColor,
                        )),
                  );
                },
              );
            },
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const AddMovieScreen(),
            ));
          },
          icon: const Icon(Icons.add),
          label: const Text("New movie"),
        ),
      ),
    );
  }
}
