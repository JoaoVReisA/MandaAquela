import 'package:get/get.dart';
import 'package:manda_aquela/core/formats/currency_format.dart';

class MusicianValuePageController extends GetxController {
  MusicianValuePageController();

  final _musicianValue = 0.0.obs;

  double get musicianValue => _musicianValue.value;

  void setMusicianValue(String value) {
    final newValue = CurrencyFormats.withSymbol.parse(value).toDouble();

    _musicianValue.value = newValue;
  }

  bool get isButtonReady => musicianValue > 0.0;
}
