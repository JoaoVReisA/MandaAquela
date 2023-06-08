import 'package:get/get.dart';
import 'package:manda_aquela/domain/entities/address.dart';

class _AddressPageStateModel {
  final street = ''.obs;
  final city = ''.obs;
  final state = ''.obs;
  final cep = ''.obs;

  bool get isFullFilled =>
      street.value.isNotEmpty &&
      city.value.isNotEmpty &&
      state.value.isNotEmpty &&
      cep.value.isNotEmpty;
}

class AddressPageController extends GetxController {
  AddressPageController();

  final _stateModel = _AddressPageStateModel();

  bool get isButtonReady => _stateModel.isFullFilled;

  void setStreet(String value) {
    _stateModel.street.value = value;
  }

  void setCity(String value) {
    _stateModel.city.value = value;
  }

  void setState(String value) {
    _stateModel.state.value = value;
  }

  void setCep(String value) {
    _stateModel.cep.value = value;
  }

  Address? getAddress() {
    if (_stateModel.isFullFilled) {
      return Address(
          cep: _stateModel.cep.value,
          city: _stateModel.city.value,
          state: _stateModel.state.value,
          street: _stateModel.street.value);
    }
    return null;
  }
}
