// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:manda_aquela/data/models/user_model.dart';
import 'package:manda_aquela/domain/repositories/AuthRepository/auth_login_repository.dart';

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
    return await authLoginRepository.tokenLogin(token: token);
  }
}
