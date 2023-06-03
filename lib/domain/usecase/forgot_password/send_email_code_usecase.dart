import 'package:manda_aquela/domain/repositories/AuthRepository/sign_up_repository.dart';

abstract class SendEmailCodeUsecase {
  Future<void> call({required String email});
}

class RemoteSendEmailCodeUsecase extends SendEmailCodeUsecase {
  final SignUpRepository repository;

  RemoteSendEmailCodeUsecase({required this.repository});

  @override
  Future<void> call({required String email}) async {
    await repository.sendResetPasswordEmailCode(email: email);
  }
}
