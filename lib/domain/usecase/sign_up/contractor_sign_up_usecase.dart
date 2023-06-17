import 'package:manda_aquela/data/models/contractor_request.dart';
import 'package:manda_aquela/domain/repositories/AuthRepository/sign_up_repository.dart';

abstract class ContractorSignUpUsecase {
  Future<void> call({required ContractorRequest contractor});
}

class RemoteContractorSignUpUsecase implements ContractorSignUpUsecase {
  RemoteContractorSignUpUsecase({required this.signUpRepository});

  final SignUpRepository signUpRepository;

  @override
  Future<void> call({required ContractorRequest contractor}) async {
    await signUpRepository.signUpContractor(contractor);
  }
}
