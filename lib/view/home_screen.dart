import 'package:flutter/material.dart';
import 'package:movielist/controller/movielist_provider.dart';
import 'package:movielist/view/addscreen/add_movie_screen.dart';
import 'package:movielist/view/listscreen/list_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final movieListProvider =
        Provider.of<MovieListProvider>(context, listen: false);
    movieListProvider.getMovieList();
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Movie list"),
          centerTitle: true,
        ),
        body:const ListMovieScreen(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const AddMovieScreen(
                type: ActionType.addMovie,
              ),
            ));
          },
          icon: const Icon(Icons.add),
          label: const Text("New movie"),
        ),
      ),
    );
  }
}
