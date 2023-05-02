import 'package:flutter/material.dart';
import 'package:movielist/controller/movieadd_provider.dart';
import 'package:movielist/controller/save_movie.dart';
import 'package:movielist/view/addscreen/add_movie_screen.dart';
import 'package:movielist/view/widgets/core_widgets.dart';
import 'package:provider/provider.dart';

class SaveWidget extends StatelessWidget {
  final ActionType type;
  final int? index;
  const SaveWidget({super.key, required this.type, this.index});

  @override
  Widget build(BuildContext context) {
    final addMovieProvider =
        Provider.of<MovieAddProvider>(context, listen: false);
    return ButtonWidget(
      child: TextButton.icon(
          onPressed: () async {
            if (addMovieProvider.picture == '') {
              addMovieProvider.changeimageValidString('Select your image');
              return;
            } else {
              addMovieProvider.changeimageValidString('');
            }
            if (addMovieProvider.formKey.currentState!.validate()) {
              switch (type) {
                case ActionType.addMovie:
                  saveMovie(
                      context: context,
                      picture: addMovieProvider.picture,
                      type: ActionType.addMovie);

                  break;
                case ActionType.editMovie:
                  saveMovie(
                      context: context,
                      picture: addMovieProvider.picture,
                      type: ActionType.editMovie,
                      index: index);

                  break;
              }
            }
          },
          icon: const Icon(
            Icons.save,
          ),
          label: const Text(
            'Save',
          )),
    );
  }
}
