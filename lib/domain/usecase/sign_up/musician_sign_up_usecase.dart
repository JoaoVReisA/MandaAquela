import 'package:manda_aquela/data/models/musician_request.dart';
import 'package:manda_aquela/domain/repositories/AuthRepository/sign_up_repository.dart';

abstract class MusicianSignUpUsecase {
  Future<void> call({required MusicianRequest musicianRequest});
}

class MusicianSignUpUsecaseImpl extends MusicianSignUpUsecase {
  MusicianSignUpUsecaseImpl({required this.signUpRepository});

  final SignUpRepository signUpRepository;

  @override
  Future<void> call({required MusicianRequest musicianRequest}) async {
    await signUpRepository.signUpMusician(musicianRequest);
  }
}
