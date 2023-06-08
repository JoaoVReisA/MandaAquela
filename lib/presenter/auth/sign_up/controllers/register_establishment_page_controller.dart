import 'package:get/get.dart';
import 'package:manda_aquela/domain/entities/establishment.dart';

class _RegisterEstablishmentStateModel {
  final establishmentName = ''.obs;
  final establishmentType = ''.obs;
  final address = ''.obs;
  final capacity = 0.obs;

  bool get isFullFilled =>
      establishmentName.value.isNotEmpty &&
      establishmentType.value.isNotEmpty &&
      address.value.isNotEmpty &&
      capacity.value != 0;
}

class RegisterEstablishmentPageController extends GetxController {
  final _stateModel = _RegisterEstablishmentStateModel();

  bool get isButtonReady => _stateModel.isFullFilled;

  void setEstablishmentName(String value) {
    _stateModel.establishmentName.value = value;
  }

  void setEstablishmentType(String value) {
    _stateModel.establishmentType.value = value;
  }

  void setAddress(String value) {
    _stateModel.address.value = value;
  }

  void setCapacity(String value) {
    _stateModel.capacity.value = int.parse(value);
  }

  Establishment? getEstablishment() {
    if (_stateModel.isFullFilled) {
      return Establishment(
          name: _stateModel.establishmentName.value,
          type: _stateModel.establishmentType.value,
          address: _stateModel.address.value,
          capacity: _stateModel.capacity.value);
    }
    return null;
  }
}
