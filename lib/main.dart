import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:manda_aquela/app.dart';

import 'core/modules/app_module.dart';

void main() {
  runApp(ModularApp(
    module: AppModule(),
    child: const AppWidget(),
  ));
}
