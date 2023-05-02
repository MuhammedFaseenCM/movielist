import 'package:flutter/material.dart';
import 'package:movielist/model/movie_model.dart';
import 'package:movielist/view/widgets/core_widgets.dart';
import 'package:movielist/view/listscreen/widgets/image_container.dart';
import 'package:movielist/view/listscreen/widgets/popup_widget.dart';
import 'package:movielist/view/listscreen/widgets/text_widget.dart';

class MovieContainer extends StatelessWidget {
  final MovieModel movieData;
  final int index;

  const MovieContainer(
      {super.key, required this.movieData, required this.index});

  @override
  Widget build(BuildContext context) {
    return ButtonWidget(
      child: Column(
        children: [
          Expanded(
              child: Stack(
            children: [
              ImageContainer(
                picture: movieData.imagePath,
                width: MediaQuery.of(context).size.width,
              ),
              Positioned(
                  right: 0.0,
                  top: 0.0,
                  child: PopupMenuWidget(
                    index: index,
                    movieModel: movieData,
                  ))
            ],
          )),
          Row(
            children: [
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(label: "Movie name", content: movieData.title),
                      TextWidget(
                          label: "Director", content: movieData.director),
                      TextWidget(label: "Year", content: movieData.year)
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
