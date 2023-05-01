import 'package:hive_flutter/adapters.dart';
part 'movie_model.g.dart';

@HiveType(typeId: 1)
class MovieModel {
  @HiveField(0)
  int? index;

  @HiveField(1)
  String title;

  @HiveField(2)
  String director;

  @HiveField(4)
  String imagePath;

  @HiveField(3)
  String year;

  MovieModel(
      {this.index,
      required this.title,
      required this.director,
      required this.year,
      required this.imagePath});
}
