import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movielist/model/movie_model.dart';

class MovieListProvider extends ChangeNotifier {
  List<MovieModel> movieList = [];

  Future<void> addMovie(MovieModel value) async {
    final movieDB = await Hive.openBox<MovieModel>('movie_db');

    final id = await movieDB.add(value);
    value.index = id;
    movieList.add(value);
    notifyListeners();
  }

  Future<void> getMovieList() async {
    final movieDB = await Hive.openBox<MovieModel>('movie_db');
    movieList.clear();
    movieList.addAll(movieDB.values);

    movieDB.delete(2);
    notifyListeners();
  }

  Future<void> deleteMovie(int? index) async {
    final movieDB = await Hive.openBox<MovieModel>('movie_db');
    await movieDB.deleteAt(index!);

    await getMovieList();
    notifyListeners();
  }

  Future<void> updateMovie(MovieModel value, int index) async {
    final movieDB = await Hive.openBox<MovieModel>('movie_db');
    await movieDB.putAt(index, value);
    getMovieList();
  }
}
