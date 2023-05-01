import 'package:flutter/material.dart';
import 'package:movielist/controller/movieadd_provider.dart';
import 'package:movielist/controller/save_movie.dart';
import 'package:movielist/view/widgets/core_widgets.dart';
import 'package:movielist/view/widgets/const_colors.dart';
import 'package:movielist/view/widgets/const_strings.dart';
import 'package:movielist/view/widgets/image_widget.dart';
import 'package:movielist/view/widgets/textformfield_widget.dart';
import 'package:provider/provider.dart';

class AddMovieScreen extends StatelessWidget {
  const AddMovieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final addMovieProvider =
        Provider.of<MovieAddProvider>(context, listen: false);
    return WillPopScope(
      onWillPop: () async {
        addMovieProvider.clear();
        return true;
      },
      child: Scaffold(
          appBar: AppBar(),
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
                              ButtonWidget(
                                  child: TextButton(
                                      onPressed: () {
                                        if (movieAddProvider.picture == '') {
                                          addMovieProvider
                                              .changeimageValidString(
                                                  'Select your image');
                                          return;
                                        } else {
                                          movieAddProvider
                                              .changeimageValidString('');
                                        }
                                        if (movieAddProvider
                                            .formKey.currentState!
                                            .validate()) {
                                          saveMovie(
                                              context: context,
                                              picture:
                                                  movieAddProvider.picture);
                                        }
                                      },
                                      child: const Text("Submit")))
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
