import 'package:flutter/material.dart';
import 'package:movielist/controller/movieadd_provider.dart';
import 'package:movielist/controller/movielist_provider.dart';
import 'package:movielist/model/movie_model.dart';
import 'package:movielist/view/addscreen/add_movie_screen.dart';
import 'package:movielist/view/widgets/const_colors.dart';
import 'package:movielist/view/widgets/core_widgets.dart';
import 'package:provider/provider.dart';

Future<void> saveMovie(
    {required context,
    required picture,
    required ActionType type,
    index}) async {
  final addMovieProvider =
      Provider.of<MovieAddProvider>(context, listen: false);
  final movieListProvider =
      Provider.of<MovieListProvider>(context, listen: false);
  final movieName = addMovieProvider.movieNameController.text.trim();
  final directorName = addMovieProvider.movieDirectorController.text.trim();
  final year = addMovieProvider.movieYearController.text.trim();

  final movie = MovieModel(
      title: movieName, director: directorName, year: year, imagePath: picture);
  if (picture == '' ||
      movieName.isEmpty ||
      directorName.isEmpty ||
      year.isEmpty) {
    snackBar(context, "Add valid details", color: kRedColor);
    return;
  }

  type == ActionType.addMovie
      ? movieListProvider.addMovie(movie)
      : movieListProvider.updateMovie(movie, index);
  snackBar(context, "Movie successfully added");
  addMovieProvider.clear();
  Navigator.of(context).pop();
}
