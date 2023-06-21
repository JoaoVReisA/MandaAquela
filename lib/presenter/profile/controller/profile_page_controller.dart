import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';
import 'package:manda_aquela/data/models/skill_model.dart';
import 'package:manda_aquela/data/models/user_model.dart';
import 'package:manda_aquela/domain/entities/establishment.dart';
import 'package:manda_aquela/domain/entities/skill.dart';
import 'package:manda_aquela/domain/usecase/get_cached_user_data_usecase.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePageController extends GetxController {
  ProfilePageController({required this.getCachedUserData});

  final GetCachedUserDataUsecase getCachedUserData;

  final _userModel = Rxn<UserModel>();

  UserModel? get userModel => _userModel.value;

  void setUserModel(UserModel userModel) {
    _userModel.value = userModel;
  }

  List<Skill> get skills =>
      _userModel.value?.skills?.map((e) => e.toEntity()).toList() ?? [];

  List<Establishment> get establishments =>
      _userModel.value?.establishments?.map((e) => e.toEntity()).toList() ?? [];

  Future<void> getUserModel() async {
    final response = await getCachedUserData.call();
    _userModel.value = response;
    print("PROFILE PAGE ${_userModel.value?.fee}");
  }

  String getSkillsStrings(List<SkillModel>? skillsP) {
    String skills = "";

    if (skillsP == null) return skills;
    for (int i = 0; i < skillsP.length; i++) {
      skills += "${skillsP[i].name}-";
      if (i == 2) {
        break;
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
