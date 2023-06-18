import 'package:get/get.dart';

class _RegisterEventStateModel {
  final name = ''.obs;
  //USe datetime
  final date = Rxn<DateTime>();
  final place = ''.obs;
  final capacity = 0.obs;

  bool get isFullFilled =>
      name.value.isNotEmpty &&
      date.value != null &&
      place.value.isNotEmpty &&
      capacity.value != 0;
}

class RegisterEventController extends GetxController {
  final _stateModel = _RegisterEventStateModel();

  bool get isButtonReady => _stateModel.isFullFilled;

  DateTime? get dateTime => _stateModel.date.value;

  void setName(String value) {
    _stateModel.name.value = value;
  }

  void setDate(DateTime value) {
    _stateModel.date.value = value;
  }

  void setPlace(String value) {
    _stateModel.place.value = value;
  }

  void setCapacity(String value) {
    _stateModel.capacity.value = int.parse(value);
  }
}
