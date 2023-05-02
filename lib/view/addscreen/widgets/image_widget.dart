import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:movielist/view/listscreen/widgets/image_container.dart';

class ImageWidget extends StatelessWidget {
  final String image;
  final dynamic imageFunction;
  const ImageWidget({super.key, required this.image, this.imageFunction});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(children: [
        ImageContainer(height: 180.0, width: 120.0, picture: image),
        Positioned(
            child: InkWell(
          onTap: () {
            imageFunction.pickImage(
                source: ImageSource.gallery, context: context);
          },
          child: const Icon(
            Icons.camera_alt,
            size: 30,
            color: Colors.white,
          ),
        ))
      ]),
    );
  }
}

class BottomSheetWidget extends StatelessWidget {
  final dynamic imageFunction;
  const BottomSheetWidget({super.key, this.imageFunction});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: <Widget>[
          const Text(
            "chooseText",
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              TextButton.icon(
                  onPressed: () {
                    imageFunction.pickImage(
                        source: ImageSource.gallery, context: context);
                  },
                  icon: const Icon(Icons.image),
                  label: const Text("gallery")),
              TextButton.icon(
                  onPressed: () {
                    imageFunction.pickImage(
                        source: ImageSource.camera, context: context);
                  },
                  icon: const Icon(Icons.camera),
                  label: const Text("camera"))
            ],
          )
        ],
      ),
    );
  }
}
