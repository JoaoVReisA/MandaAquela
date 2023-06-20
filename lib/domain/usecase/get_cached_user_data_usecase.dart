import 'package:manda_aquela/core/custom_exceptions.dart';
import 'package:manda_aquela/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class GetCachedUserDataUsecase {
  Future<UserModel> call();
}

class LocalGetCachedUserDataUsecase implements GetCachedUserDataUsecase {
  @override
  Future<UserModel> call() async {
    final prefs = await SharedPreferences.getInstance();
    final userData = prefs.getString('userData');
    if (userData != null) {
      return UserModel.fromJson(userData);
    } else {
      throw BadRequestException('User not found');
    }
  }
}
