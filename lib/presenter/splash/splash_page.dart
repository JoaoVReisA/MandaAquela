import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:manda_aquela/presenter/common/assets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Future.delayed(
        const Duration(
          seconds: 3,
        ),
        () async {
          String uid = '';
          await SharedPreferences.getInstance()
              .then((value) => uid = value.getString('userData') ?? '');
          if (uid.isNotEmpty) {
            Modular.to.navigate('/start/home');
          } else {
            Modular.to.navigate('/auth/');
          }
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).colorScheme.primary,
        child: Center(child: SvgPicture.asset(Assets.logo.path)),
      ),
    );
  }
}
