import 'dart:io';
import 'package:flutter/material.dart';
import 'package:movielist/view/widgets/const_strings.dart';

class ImageContainer extends StatelessWidget {
  final double? height;
  final double? width;
  final String picture;
  const ImageContainer(
      {super.key, this.height, this.width, required this.picture});

  @override
  Widget build(BuildContext context) {
    return picture == ''
        ? Container(
            height: 180,
            width: 120,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: Colors.grey,
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(defaultProfText),
                )))
        : Container(
            height: height ?? 200,
            width: width ?? 120,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: FileImage(
                      File(picture),
                    ))));
  }
}
