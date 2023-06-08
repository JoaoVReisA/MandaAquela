import 'package:get/get.dart';

class _SocialMediaPageStateModel {
  final instagram = ''.obs;
  final tikTok = ''.obs;
  final facebook = ''.obs;
  final youtube = ''.obs;
}

class SocialMediaPageController extends GetxController {
  final _stateModel = _SocialMediaPageStateModel();

  void setInstagram(String value) {
    _stateModel.instagram.value = value;
  }

  void setFacebook(String value) {
    _stateModel.facebook.value = value;
  }

  void setYoutube(String value) {
    _stateModel.youtube.value = value;
  }

  void setTikTok(String value) {
    _stateModel.tikTok.value = value;
  }

  List<String?> getSocialMedias() {
    return [
      _stateModel.instagram.value,
      _stateModel.facebook.value,
      _stateModel.tikTok.value,
      _stateModel.youtube.value,
    ];
  }
}
