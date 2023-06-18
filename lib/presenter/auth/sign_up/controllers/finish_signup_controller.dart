import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';
import 'package:manda_aquela/data/models/contractor_request.dart';
import 'package:manda_aquela/data/models/musician_request.dart';
import 'package:manda_aquela/domain/entities/user_firebase_info.dart';
import 'package:manda_aquela/domain/usecase/login/token_auth_login_usecase.dart';
import 'package:manda_aquela/domain/usecase/sign_up/contractor_sign_up_usecase.dart';
import 'package:manda_aquela/domain/usecase/sign_up/musician_sign_up_usecase.dart';
import 'package:manda_aquela/presenter/auth/sign_up/controllers/add_image_page_controller.dart';
import 'package:manda_aquela/presenter/auth/sign_up/controllers/address_page_controller.dart';
import 'package:manda_aquela/presenter/auth/sign_up/controllers/is_musician_or_contractor_controller.dart';
import 'package:manda_aquela/presenter/auth/sign_up/controllers/musician_description_page_controller.dart';
import 'package:manda_aquela/presenter/auth/sign_up/controllers/musician_value_page_controller.dart';
import 'package:manda_aquela/presenter/auth/sign_up/controllers/register_establishment_page_controller.dart';
import 'package:manda_aquela/presenter/auth/sign_up/controllers/select_your_skills_page_controller.dart';
import 'package:manda_aquela/presenter/auth/sign_up/controllers/social_media_page_controller.dart';

class FinishSignUpController extends GetxController {
  FinishSignUpController({
    required this.musicianSignUpUsecase,
    required this.tokenAuthLoginUseCase,
    required this.contractorSignUpUsecase,
  });

  final MusicianSignUpUsecase musicianSignUpUsecase;
  final TokenAuthLoginUseCase tokenAuthLoginUseCase;
  final ContractorSignUpUsecase contractorSignUpUsecase;

  // Page controllers
  final _addImagePageController = Modular.get<AddImagePageController>();
  final _addressPageController = Modular.get<AddressPageController>();
  final _isMusicianOrContractorController =
      Modular.get<IsMusicianOrContractorController>();
  final _musicianDescriptionController =
      Modular.get<MusicianDescriptionPageController>();
  final _musicianValueController = Modular.get<MusicianValuePageController>();
  final _registerEstablishmentController =
      Modular.get<RegisterEstablishmentPageController>();
  final _selectYourSkillsController =
      Modular.get<SelectYourSkillsPageController>();
  final _socialMediaController = Modular.get<SocialMediaPageController>();

  Future<dynamic> getUserData() async {
    if (_isMusicianOrContractorController.isMusicianSelected) {
      final skillsModel = _selectYourSkillsController
          .selectedList()
          ?.map((e) => e!.toModel())
          .toList();

      final base64Image = await _addImagePageController.imageBase64();

      final musician = MusicianRequest(
        uuid: UserFirebaseInfo.instance.uid ?? 'id',
        description: _musicianDescriptionController.description,
        skills: skillsModel!,
        fee: _musicianValueController.musicianValue.toString(),
        address: _addressPageController.getAddress().toModel(),
        socialMedia: _socialMediaController.getSocialMedias(),
      );

      return musician;
    } else {
      final base64Image = await _addImagePageController.imageBase64();

      final contractor = ContractorRequest(
        uuid: UserFirebaseInfo.instance.uid ?? 'id',
        address: _addressPageController.getAddress().toModel(),
        description: _musicianDescriptionController.description,
        establishment:
            _registerEstablishmentController.getEstablishment()?.toModel(),
        socialMedia: _socialMediaController.getSocialMedias(),
        imageBase64: base64Image,
      );
      return contractor;
    }
  }

  Future<void> sendUserData() async {
    final user = await getUserData();
    try {
      if (user is MusicianRequest) {
        final response =
            await musicianSignUpUsecase.call(musicianRequest: user);

        await tokenAuthLoginUseCase.call(token: user.uuid);
      } else {
        final response = await contractorSignUpUsecase.call(
          contractor: user as ContractorRequest,
        );

        await tokenAuthLoginUseCase.call(token: user.uuid);
      }
    } catch (e) {
      //add error modal
      print(e);
    }
  }
}
