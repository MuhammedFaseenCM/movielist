import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:movielist/controller/movielist_provider.dart';
import 'package:movielist/view/widgets/const_colors.dart';
import 'package:provider/provider.dart';

class ButtonWidget extends StatelessWidget {
  final Widget child;
  final double? height;
  final double? width;
  const ButtonWidget({super.key, required this.child, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 50.0,
      width: width ?? 150.0,
      decoration: BoxDecoration(
          color: kwhiteColor,
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: const [
            BoxShadow(
              color: purpleColor,
              spreadRadius: 0.1,
              blurRadius: 8.0,
              offset: Offset(2, 2),
            ),
            BoxShadow(
              color: kwhiteColor,
              spreadRadius: 0.1,
              blurRadius: 8.0,
              offset: Offset(-2, -2),
            )
          ]),
      child: child,
    );
  }
}

Future<void> snackBar(BuildContext context, text, {color}) async {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(text),
    backgroundColor: color ?? kGreenColor,
    behavior: SnackBarBehavior.floating,
    margin: const EdgeInsets.all(10),
  ));
}

Future<void> deleteMovieButton(int? index, context) async {
  log(index.toString());
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Are you sure want to delete ?'),
          actions: [
            TextButton(
              onPressed: () {
                Provider.of<MovieListProvider>(context, listen: false)
                    .deleteMovie(index);
                Navigator.of(context).pop();
                Navigator.of(context).pop();
                snackBar(context, 'Succesfully deleted');
              },
              child: const Text('Yes'),
            ),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('No'))
          ],
        );
      });
}
