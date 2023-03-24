import 'package:flutter_modular/flutter_modular.dart';
import 'package:manda_aquela/data/repositories/auth_login_repository.dart';
import 'package:manda_aquela/domain/usecase/login/auth_login.dart';
import 'package:manda_aquela/presenter/login/login_page.dart';

import '../../domain/repositories/AuthRepository/auth_login_repository.dart';

class LoginModule extends Module {
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
        ChildRoute('/', child: (context, args) => const LoginPage()),
      ];
}
