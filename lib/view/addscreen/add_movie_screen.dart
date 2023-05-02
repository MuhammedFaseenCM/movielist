import 'package:flutter/material.dart';
import 'package:movielist/controller/movieadd_provider.dart';
import 'package:movielist/model/movie_model.dart';
import 'package:movielist/view/addscreen/widgets/save_widget.dart';
import 'package:movielist/view/widgets/core_widgets.dart';
import 'package:movielist/view/widgets/const_colors.dart';
import 'package:movielist/view/widgets/const_strings.dart';
import 'package:movielist/view/addscreen/widgets/image_widget.dart';
import 'package:movielist/view/addscreen/widgets/textformfield_widget.dart';
import 'package:provider/provider.dart';

enum ActionType { addMovie, editMovie }

class AddMovieScreen extends StatelessWidget {
  final ActionType type;
  final MovieModel? movieModel;
  final int? index;
  const AddMovieScreen(
      {super.key, required this.type, this.movieModel, this.index});

  @override
  Widget build(BuildContext context) {
    final addMovieProvider =
        Provider.of<MovieAddProvider>(context, listen: false);
    if (type == ActionType.editMovie) {
      addMovieProvider.movieNameController.text = movieModel!.title;
      addMovieProvider.movieDirectorController.text = movieModel!.director;
      addMovieProvider.movieYearController.text = movieModel!.year;
      addMovieProvider.picture = movieModel!.imagePath;
    }
    return WillPopScope(
      onWillPop: () async {
        addMovieProvider.clear();
        return true;
      },
      child: Scaffold(
          appBar: AppBar(
            title:
                Text(type == ActionType.addMovie ? "Add movie" : "Edit movie"),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Form(
                      key: addMovieProvider.formKey,
                      child: Consumer<MovieAddProvider>(
                        builder: (context, movieAddProvider, child) {
                          return Column(
                            children: [
                              movieAddProvider.picture == ''
                                  ? ImageWidget(
                                      image: '',
                                      imageFunction: movieAddProvider,
                                    )
                                  : ImageWidget(
                                      image: movieAddProvider.picture,
                                      imageFunction: movieAddProvider,
                                    ),
                              kheight20,
                              Text(
                                movieAddProvider.imageValid,
                                style: const TextStyle(color: kRedColor),
                              ),
                              kheight20,
                              TextFormFieldWidget(
                                  hintText: "Movie name",
                                  controller:
                                      movieAddProvider.movieNameController),
                              kheight20,
                              TextFormFieldWidget(
                                  hintText: "Director",
                                  controller:
                                      movieAddProvider.movieDirectorController),
                              kheight20,
                              TextFormFieldWidget(
                                  hintText: "year",
                                  keyBoardType: TextInputType.datetime,
                                  controller:
                                      movieAddProvider.movieYearController),
                              kheight20,
                              SaveWidget(
                                type: type,
                                index: index,
                              )
                            ],
                          );
                        },
                      )),
                )
              ],
            ),
          )),
    );
  }
}

final scaffoldKey = GlobalKey<ScaffoldState>();
