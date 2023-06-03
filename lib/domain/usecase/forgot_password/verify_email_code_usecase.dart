import 'package:manda_aquela/domain/repositories/AuthRepository/sign_up_repository.dart';

abstract class VerifyEmailCodeUsecase {
  Future<String> call({required String code});
}

class RemoteVerifyEmailCodeUsecase extends VerifyEmailCodeUsecase {
  RemoteVerifyEmailCodeUsecase({required this.repository});
  final SignUpRepository repository;

  @override
  Future<String> call({required String code}) async {
    return repository.verifyEmailCode(code: code);
  }
}
