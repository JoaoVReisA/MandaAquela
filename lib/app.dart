import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'color_schemes.g.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Manda Aquela',
      theme: ThemeData(
        colorScheme: lightColorScheme,
        fontFamily: 'Outfit',
        inputDecorationTheme: const InputDecorationTheme(
          isDense: true,
          contentPadding: EdgeInsets.symmetric(
            vertical: 15.0,
            horizontal: 17.0,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8.0),
            ),
          ),
        ),
      ),
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
      debugShowCheckedModeBanner: false,
    );
  }
}
