import 'package:get/get.dart';

class MusicianDescriptionPageController extends GetxController {
  MusicianDescriptionPageController();
  final _description = ''.obs;

  void setDescription(String value) => _description.value = value;

  bool get isButtonReady => _description.value.isNotEmpty;
}
