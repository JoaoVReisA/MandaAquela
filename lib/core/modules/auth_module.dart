import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_picker/image_picker.dart';
import 'package:manda_aquela/data/repositories/auth_login_repository.dart';
import 'package:manda_aquela/data/repositories/sign_up_repository.dart';
import 'package:manda_aquela/domain/repositories/AuthRepository/auth_login_repository.dart';
import 'package:manda_aquela/domain/repositories/AuthRepository/sign_up_repository.dart';
import 'package:manda_aquela/domain/usecase/forgot_password/send_email_code_usecase.dart';
import 'package:manda_aquela/domain/usecase/login/email_auth_login_usecase.dart';
import 'package:manda_aquela/domain/usecase/login/facebook_auth_login.dart';
import 'package:manda_aquela/domain/usecase/login/google_auth_login.dart';
import 'package:manda_aquela/domain/usecase/login/token_auth_login_usecase.dart';
import 'package:manda_aquela/domain/usecase/sign_up/musician_sign_up_usecase.dart';
import 'package:manda_aquela/domain/usecase/sign_up/sign_up_usecase.dart';
import 'package:manda_aquela/presenter/auth/forgot_password/controllers/forgot_password_page_controller.dart';
import 'package:manda_aquela/presenter/auth/forgot_password/send_email_page.dart';
import 'package:manda_aquela/presenter/auth/login/controllers/login_page_controller.dart';
import 'package:manda_aquela/presenter/auth/login/login_page.dart';
import 'package:manda_aquela/presenter/auth/sign_up/add_image_page.dart';
import 'package:manda_aquela/presenter/auth/sign_up/address_page.dart';
import 'package:manda_aquela/presenter/auth/sign_up/contractor/register_establishment_page.dart';
import 'package:manda_aquela/presenter/auth/sign_up/controllers/add_image_page_controller.dart';
import 'package:manda_aquela/presenter/auth/sign_up/controllers/address_page_controller.dart';
import 'package:manda_aquela/presenter/auth/sign_up/controllers/finish_signup_controller.dart';
import 'package:manda_aquela/presenter/auth/sign_up/controllers/is_musician_or_contractor_controller.dart';
import 'package:manda_aquela/presenter/auth/sign_up/controllers/musician_description_page_controller.dart';
import 'package:manda_aquela/presenter/auth/sign_up/controllers/musician_value_page_controller.dart';
import 'package:manda_aquela/presenter/auth/sign_up/controllers/register_establishment_page_controller.dart';
import 'package:manda_aquela/presenter/auth/sign_up/controllers/select_your_skills_page_controller.dart';
import 'package:manda_aquela/presenter/auth/sign_up/controllers/sign_up_page_controller.dart';
import 'package:manda_aquela/presenter/auth/sign_up/controllers/social_media_page_controller.dart';
import 'package:manda_aquela/presenter/auth/sign_up/is_musician_or_contractor_page.dart';
import 'package:manda_aquela/presenter/auth/sign_up/musician/musician_description_page.dart';
import 'package:manda_aquela/presenter/auth/sign_up/musician/musician_value_page.dart';
import 'package:manda_aquela/presenter/auth/sign_up/musician/select_your_skills_page.dart';
import 'package:manda_aquela/presenter/auth/sign_up/sign_up_page.dart';
import 'package:manda_aquela/presenter/auth/sign_up/social_media_page.dart';

class AuthModule extends Module {
  @override
  List<Bind> get binds => [
        Bind<LoginPageController>(
          (i) => LoginPageController(
            emailAuthLoginUsecase: i(),
            tokenAuthLoginUseCase: i(),
          ),
          export: true,
        ),
        Bind<EmailAuthLoginUsecase>(
            export: true, (i) => RemoteEmailAuthLoginUsecase(repository: i())),
        Bind<GoogleAuthLoginUsecase>(
          export: true,
          (i) => RemoteGoogleAuthLoginUsecase(i()),
        ),
        Bind<FacebookAuthLoginUsecase>(
          export: true,
          (i) => RemoteFacebookAuthLoginUsecase(i()),
        ),
        Bind<AuthLoginRepository>(
          export: true,
          (i) => RemoteAuthLoginRepository(
            client: i(),
          ),
        ),
        Bind<SignUpPageController>(
            export: true, (i) => SignUpPageController(signUpUsecase: i())),
        Bind<SignUpUsecase>(
          export: true,
          (i) => EmailSignUpUsecase(signUpRepository: i()),
        ),
        Bind<SignUpRepository>(
          export: true,
          (i) => SignUpRepositoryImpl(httpService: i()),
        ),
        Bind<ForgotPasswordPageController>(
          (i) => ForgotPasswordPageController(
            sendEmailCodeUsecase: i(),
          ),
          export: true,
        ),
        Bind<SendEmailCodeUsecase>(
          (i) => RemoteSendEmailCodeUsecase(repository: i()),
          export: true,
        ),
        Bind<IsMusicianOrContractorController>(
          (i) => IsMusicianOrContractorController(),
          export: true,
        ),
        Bind<AddressPageController>(
          (i) => AddressPageController(),
          export: true,
        ),
        Bind<AddImagePageController>(
          (i) => AddImagePageController(imagePicker: ImagePicker()),
          export: true,
        ),
        Bind<SocialMediaPageController>(
          (i) => SocialMediaPageController(),
          export: true,
        ),
        Bind<SelectYourSkillsPageController>(
          (i) => SelectYourSkillsPageController(
            fetchSkillListUsecase: i(),
          ),
          export: true,
        ),
        Bind<MusicianValuePageController>(
          (i) => MusicianValuePageController(),
          export: true,
        ),
        Bind<MusicianDescriptionPageController>(
          (i) => MusicianDescriptionPageController(),
          export: true,
        ),
        Bind<RegisterEstablishmentPageController>(
          (i) => RegisterEstablishmentPageController(),
          export: true,
        ),
        Bind<FinishSignUpController>(
          (i) => FinishSignUpController(
            musicianSignUpUsecase: i(),
            tokenAuthLoginUseCase: i(),
          ),
          export: true,
        ),
        Bind<MusicianSignUpUsecase>(
            (i) => MusicianSignUpUsecaseImpl(signUpRepository: i()),
            export: true),
        Bind<TokenAuthLoginUseCase>(
          (i) => TokenAuthLoginUseCaseImpl(authLoginRepository: i()),
          export: true,
        )
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const LoginPage()),
        ChildRoute('/sign_up', child: (_, __) => const SignUpPage()),
        ChildRoute(
          '/is_musician_or_contractor',
          child: (_, __) => const IsMusicianOrContractorPage(),
        ),
        ChildRoute(
          '/send_email',
          child: (_, __) => const SendEmailPage(),
        ),
        ChildRoute(
          '/address',
          child: (_, __) => const AddressPage(),
        ),
        ChildRoute(
          '/add_image',
          child: (_, __) => const AddImagePage(),
        ),
        ChildRoute(
          '/social_media',
          child: (_, __) => const SocialMediaPage(),
        ),
        ChildRoute(
          '/select_skills',
          child: (_, __) => const SelectYourSkillsPage(),
        ),
        ChildRoute(
          '/musician_description',
          child: (_, __) => const MusicianDescriptionPage(),
        ),
        ChildRoute(
          '/musician_value',
          child: (_, __) => const MusicianValuePage(),
        ),
        ChildRoute(
          '/register_establishment',
          child: (_, __) => const RegisterEstablishmentPage(),
        ),
      ];
}
