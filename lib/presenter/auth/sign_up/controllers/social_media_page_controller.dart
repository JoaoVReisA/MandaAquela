import 'package:get/get.dart';
import 'package:manda_aquela/domain/entities/social_media.dart';

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

  List<SocialMedia>? getSocialMedias() {
    return [
      SocialMedia(link: _stateModel.instagram.value, type: 'instagram'),
      SocialMedia(link: _stateModel.facebook.value, type: 'facebook'),
      SocialMedia(link: _stateModel.tikTok.value, type: 'tiktok'),
      SocialMedia(link: _stateModel.youtube.value, type: 'youtube'),
    ];
  }
}
