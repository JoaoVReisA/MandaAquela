import 'package:get/get.dart';

class IsMusicianOrContractorController extends GetxController {
  final RxBool _isMusicianSelected = false.obs;

  bool get isMusicianSelected => _isMusicianSelected.value;

  void toggleIsMusicianSelectedSelected() {
    if (isContractorSelected) {
      toggleIsContractorSelected();
    }
    _isMusicianSelected.value = !isMusicianSelected;
  }

  final RxBool _isContractorSelected = false.obs;

  bool get isContractorSelected => _isContractorSelected.value;

  bool get isContinueButtonReady => isContractorSelected || isMusicianSelected;

  void toggleIsContractorSelected() {
    if (isMusicianSelected) {
      toggleIsMusicianSelectedSelected();
    }
    _isContractorSelected.value = !isContractorSelected;
  }

  String get selectionText {
    if (isMusicianSelected) {
      return 'Músico';
    }
    if (isContractorSelected) {
      return 'Contratante';
    }
    return 'Selecione um dos dois para continuar';
  }
}
