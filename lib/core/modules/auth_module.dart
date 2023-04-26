import 'package:flutter_modular/flutter_modular.dart';
import 'package:manda_aquela/data/repositories/auth_login_repository.dart';
import 'package:manda_aquela/domain/usecase/login/auth_login.dart';
import 'package:manda_aquela/presenter/auth/forgot_password_page.dart';
import 'package:manda_aquela/presenter/auth/login/login_page.dart';
import 'package:manda_aquela/presenter/auth/sign_up/sign_up_page.dart';

import '../../domain/repositories/AuthRepository/auth_login_repository.dart';

class AuthModule extends Module {
  @override
  List<Bind> get binds => [
        Bind<EmailAuthLoginUsecase>(
          (i) => EmailAuthLoginUsecase(i()),
        ),
        Bind<GoogleAuthLoginUsecase>(
          (i) => GoogleAuthLoginUsecase(i()),
        ),
        Bind<FacebookAuthLoginUsecase>(
          (i) => FacebookAuthLoginUsecase(i()),
        ),
        Bind<AuthLoginRepository>(
          (i) => RemoteAuthLoginRepository(client: i(), mapperResponse: i()),
        )
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/',
            child: (context, args) => const LoginPage(), children: []),
        ChildRoute('/sign_up', child: (_, __) => const SignUpPage()),
        ChildRoute('/forgot_password',
            child: (_, __) => const ForgotPasswordPage()),
      ];
}
