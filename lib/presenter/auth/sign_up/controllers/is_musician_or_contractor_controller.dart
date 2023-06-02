import 'package:get/get.dart';

class IsMusicianOrContractorController extends GetxController {
  final RxBool _isMusicianSelected = false.obs;

  bool get isMusicianSelected => _isMusicianSelected.value;

  void setIsMusicianSelectedSelected(bool value) {
    if (isContractorSelected) {
      setIsContractorSelected(false);
    }
    _isMusicianSelected.value = value;
  }

  final RxBool _isContractorSelected = false.obs;

  bool get isContractorSelected => _isContractorSelected.value;

  bool get isContinueButtonReady => isContractorSelected || isMusicianSelected;

  void setIsContractorSelected(bool value) {
    if (isMusicianSelected) {
      setIsMusicianSelectedSelected(false);
    }
    _isContractorSelected.value = value;
  }
}
