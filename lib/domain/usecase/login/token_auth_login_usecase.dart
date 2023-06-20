// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:manda_aquela/data/models/user_model.dart';
import 'package:manda_aquela/domain/repositories/AuthRepository/auth_login_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class TokenAuthLoginUseCase {
  Future<UserModel> call({required String token});
}

class TokenAuthLoginUseCaseImpl implements TokenAuthLoginUseCase {
  TokenAuthLoginUseCaseImpl({
    required this.authLoginRepository,
  });
  final AuthLoginRepository authLoginRepository;

  @override
  Future<UserModel> call({required String token}) async {
    final response = await authLoginRepository.tokenLogin(token: token);

    await SharedPreferences.getInstance().then(
      (value) => value.setString('userData', response.toJson()),
    );

    return response;
  }
}
