import 'package:get/get.dart';

class _RegisterEventStateModel {
  final name = ''.obs;
  //USe datetime
  final date = ''.obs;
  final place = ''.obs;
  final capacity = 0.obs;

  bool get isFullFilled =>
      name.value.isNotEmpty &&
      date.value.isNotEmpty &&
      place.value.isNotEmpty &&
      capacity.value != 0;
}

class RegisterEventController extends GetxController {
  final _stateModel = _RegisterEventStateModel();

  bool get isButtonReady => _stateModel.isFullFilled;

  void setName(String value) {
    _stateModel.name.value = value;
  }

  void setDate(String value) {
    _stateModel.date.value = value;
  }

  void setPlace(String value) {
    _stateModel.place.value = value;
  }

  void setCapacity(String value) {
    _stateModel.capacity.value = int.parse(value);
  }
}
