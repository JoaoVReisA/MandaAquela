import 'package:flutter_modular/flutter_modular.dart';
import 'package:manda_aquela/data/repositories/auth_login_repository.dart';
import 'package:manda_aquela/data/repositories/sign_up_repository.dart';
import 'package:manda_aquela/domain/repositories/AuthRepository/auth_login_repository.dart';
import 'package:manda_aquela/domain/repositories/AuthRepository/sign_up_repository.dart';
import 'package:manda_aquela/domain/usecase/login/email_auth_login_usecase.dart';
import 'package:manda_aquela/domain/usecase/login/facebook_auth_login.dart';
import 'package:manda_aquela/domain/usecase/login/google_auth_login.dart';
import 'package:manda_aquela/domain/usecase/login/sign_up_usecase.dart';
import 'package:manda_aquela/presenter/auth/forgot_password_page.dart';
import 'package:manda_aquela/presenter/auth/login/controllers/login_page_controller.dart';
import 'package:manda_aquela/presenter/auth/login/login_page.dart';
import 'package:manda_aquela/presenter/auth/sign_up/controllers/sign_up_page_controller.dart';
import 'package:manda_aquela/presenter/auth/sign_up/is_musician_or_contractor_page.dart';
import 'package:manda_aquela/presenter/auth/sign_up/sign_up_page.dart';

class AuthModule extends Module {
  @override
  List<Bind> get binds => [
        Bind<LoginPageController>(
            (i) => LoginPageController(
                  emailAuthLoginUsecase: i(),
                ),
            export: true),
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
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const LoginPage()),
        ChildRoute('/sign_up', child: (_, __) => const SignUpPage()),
        ChildRoute('/forgot_password',
            child: (_, __) => const ForgotPasswordPage()),
        ChildRoute(
          '/is_musician_or_contractor',
          child: (_, __) => const IsMusicianOrContractorPage(),
        ),
      ];
}
