import 'package:manda_aquela/domain/repositories/AuthRepository/sign_up_repository.dart';

abstract class SendEmailCodeUsecase {
  Future<bool> call({required String email});
}

class RemoteSendEmailCodeUsecase extends SendEmailCodeUsecase {
  final SignUpRepository repository;

  RemoteSendEmailCodeUsecase({required this.repository});

  @override
  Future<bool> call({required String email}) async {
    return await repository.sendResetPasswordEmailCode(email: email);
  }
}
