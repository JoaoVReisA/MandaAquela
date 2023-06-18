import 'package:get/get.dart';
import 'package:manda_aquela/data/models/user_model.dart';
import 'package:manda_aquela/domain/usecase/get_cached_user_data_usecase.dart';

class ProfilePageController extends GetxController {
  ProfilePageController({required this.getCachedUserData});

  final GetCachedUserDataUsecase getCachedUserData;

  final userModel = Rxn<UserModel>();

  Future<void> getUserModel() async {
    final response = await getCachedUserData.call();
    userModel.value = response;
    print("PROFILE PAGE ${userModel.value?.fee}");
  }
}
