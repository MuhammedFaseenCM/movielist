import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MovieAddProvider extends ChangeNotifier {
  TextEditingController movieNameController = TextEditingController();
  TextEditingController movieYearController = TextEditingController();
  TextEditingController movieDirectorController = TextEditingController();
  String picture = '';
  String imageValid = '';
  String nochangeText = '';

  final formKey = GlobalKey<FormState>();

  String get value => picture;

  set value(String newValue) {
    picture = newValue;
    notifyListeners();
  }

  void changePictureString(text) {
    picture = text;
    notifyListeners();
  }

  void noChangeText() {
    nochangeText = 'No changes found';
    notifyListeners();
  }

  void changeimageValidString(text) {
    imageValid = text;
    notifyListeners();
  }

  final ImagePicker picker = ImagePicker();

  pickImage({required source, required context}) async {
    final image = await picker.pickImage(source: source);
    if (image == null) {
      return;
    }
    picture = image.path;

    notifyListeners();
  }

  void clear() {
    picture = '';
    changePictureString("");
    changeimageValidString("");
    movieDirectorController.clear();
    movieNameController.clear();
    movieYearController.clear();
  }
}
