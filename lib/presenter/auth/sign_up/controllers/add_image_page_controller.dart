import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddImagePageController extends GetxController {
  AddImagePageController({required this.imagePicker});
  final ImagePicker imagePicker;

  final Rx<XFile?> _image = Rx<XFile?>(null);

  XFile? get image => _image.value;

  //TODO: Create this
  bool get isButtonReady => true;

  Future<void> getImage() async {
    final image = await imagePicker.pickImage(source: ImageSource.gallery);

    _image.value = image;
    print(image);
  }

  Future<String?> imageBase64() async {
    if (_image.value == null) return null;

    final file = File(_image.value!.path);
    Uint8List imagebytes = await file.readAsBytes();
    String base64Image = base64.encode(imagebytes);
    print(base64Image);
    return base64Image;
  }
}
