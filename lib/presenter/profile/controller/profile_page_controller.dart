import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';
import 'package:manda_aquela/data/models/user_model.dart';
import 'package:manda_aquela/domain/usecase/get_cached_user_data_usecase.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePageController extends GetxController {
  ProfilePageController({required this.getCachedUserData});

  final GetCachedUserDataUsecase getCachedUserData;

  final _userModel = Rxn<UserModel>();

  UserModel? get userModel => _userModel.value;

  Future<void> getUserModel() async {
    final response = await getCachedUserData.call();
    _userModel.value = response;
    print("PROFILE PAGE ${_userModel.value?.fee}");
  }

  String get getSkillsStrings {
    String skills = "";
    if (_userModel.value?.skills != null) {
      for (int i = 0; i < _userModel.value!.skills!.length; i++) {
        skills += "${_userModel.value?.skills?[i].name}-";
        if (i == 2) {
          break;
        }
      }
    }
    return skills;
  }

  void logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('userData');

    Modular.to.pushNamedAndRemoveUntil(
      '/auth/',
      (_) => false,
    );
  }
}
