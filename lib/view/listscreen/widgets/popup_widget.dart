import 'package:flutter/material.dart';
import 'package:movielist/controller/movielist_provider.dart';
import 'package:movielist/model/movie_model.dart';
import 'package:movielist/view/addscreen/add_movie_screen.dart';
import 'package:movielist/view/widgets/const_colors.dart';
import 'package:movielist/view/widgets/core_widgets.dart';
import 'package:provider/provider.dart';

class PopupMenuWidget extends StatelessWidget {
  final int? index;
  final MovieModel movieModel;
  const PopupMenuWidget(
      {super.key, required this.index, required this.movieModel});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Consumer<MovieListProvider>(
      builder: (context, value, child) => PopupMenuButton(
        icon: const Icon(
          Icons.more_vert,
          color: kwhiteColor,
          shadows: [Shadow(blurRadius: 5.0, color: kblackColor)],
        ),
        itemBuilder: (context) => [
          PopupMenuItem(
              child: TextButton.icon(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => AddMovieScreen(
                        type: ActionType.editMovie,
                        movieModel: movieModel,
                        index: index,
                      ),
                    ));
                  },
                  icon: const Icon(Icons.edit),
                  label: Text("Edit", style: textTheme.subtitle2))),
          PopupMenuItem(
              child: Consumer<MovieListProvider>(
            builder: (context, value, child) => SizedBox(
                width: 101.0,
                child: TextButton.icon(
                  onPressed: () {
                    deleteMovieButton(index, context);
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: kRedColor,
                  ),
                  label:
                      Text("delete", maxLines: 3, style: textTheme.subtitle2),
                )),
          ))
        ],
      ),
    );
  }
}
