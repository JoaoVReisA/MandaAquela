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
  }
}
