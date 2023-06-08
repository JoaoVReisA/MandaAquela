import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';
import 'package:manda_aquela/domain/entities/user_entity.dart';
import 'package:manda_aquela/domain/entities/user_firebase_info.dart';
import 'package:manda_aquela/presenter/auth/sign_up/controllers/add_image_page_controller.dart';
import 'package:manda_aquela/presenter/auth/sign_up/controllers/address_page_controller.dart';
import 'package:manda_aquela/presenter/auth/sign_up/controllers/is_musician_or_contractor_controller.dart';
import 'package:manda_aquela/presenter/auth/sign_up/controllers/musician_description_page_controller.dart';
import 'package:manda_aquela/presenter/auth/sign_up/controllers/musician_value_page_controller.dart';
import 'package:manda_aquela/presenter/auth/sign_up/controllers/register_establishment_page_controller.dart';
import 'package:manda_aquela/presenter/auth/sign_up/controllers/select_your_skills_page_controller.dart';
import 'package:manda_aquela/presenter/auth/sign_up/controllers/social_media_page_controller.dart';

class FinishSignUpController extends GetxController {
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

  Future<UserEntity> getUserData() async {
    final user = UserEntity(
      id: UserFirebaseInfo.instance.uid ?? 'id',
      name: UserFirebaseInfo.instance.name ?? 'Name',
      email: UserFirebaseInfo.instance.email ?? 'email',
      isMusician: _isMusicianOrContractorController.isMusicianSelected,
      isContractor: _isMusicianOrContractorController.isContractorSelected,
      isSignUpCompleted: true,
      description: _musicianDescriptionController.description,
      socialMedias: _socialMediaController.getSocialMedias(),
      address: _addressPageController.getAddress(),
      establishment: _registerEstablishmentController.getEstablishment(),
      image: _addImagePageController.image?.mimeType,
      musicianValue: _musicianValueController.musicianValue,
      skills: _selectYourSkillsController.selectedList(),
    );

    return user;
  }

  void sendUserData() async {
    final user = await getUserData();
    print(user.name);
    print(user.email);
    print(user.id);
  }
}
