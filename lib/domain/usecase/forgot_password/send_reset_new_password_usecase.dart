import 'package:manda_aquela/domain/repositories/AuthRepository/sign_up_repository.dart';

abstract class SendResetNewPasswordUsecase {
  Future<void> call({required String code, required String newPassword});
}

class RemoteSendResetNewPasswordUsecase extends SendResetNewPasswordUsecase {
  RemoteSendResetNewPasswordUsecase({required this.repository});
  final SignUpRepository repository;

  @override
  Future<void> call({required String code, required String newPassword}) async {
    await repository.sendResetNewPassword(code: code, newPassword: newPassword);
  }
}
