import 'package:manda_aquela/domain/entities/user_request.dart';
import 'package:manda_aquela/domain/repositories/AuthRepository/sign_up_repository.dart';

abstract class SignUpUsecase {
  Future<bool> call({required UserRequest userRequest});
}

class EmailSignUpUsecase extends SignUpUsecase {
  EmailSignUpUsecase({required this.signUpRepository});

  final SignUpRepository signUpRepository;

  @override
  Future<bool> call({required UserRequest userRequest}) async {
    signUpRepository.emailSignUp(userRequest);
    return true;
  }
}
