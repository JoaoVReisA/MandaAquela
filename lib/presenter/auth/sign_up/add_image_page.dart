import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:manda_aquela/color_schemes.g.dart';
import 'package:manda_aquela/presenter/auth/sign_up/controllers/add_image_page_controller.dart';
import 'package:manda_aquela/presenter/auth/sign_up/controllers/finish_signup_controller.dart';
import 'package:manda_aquela/presenter/common/assets.dart';
import 'package:manda_aquela/presenter/common/text_styles.dart';
import 'package:manda_aquela/presenter/widgets/custom_button/custom_button.dart';

class AddImagePage extends StatefulWidget {
  const AddImagePage({super.key});

  @override
  State<AddImagePage> createState() => _AddImagePageState();
}

class _AddImagePageState extends State<AddImagePage> {
  final _controller = Modular.get<AddImagePageController>();
  final _finishSignUpController = Modular.get<FinishSignUpController>();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Obx(
      () => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(child: SvgPicture.asset(Assets.findImage.path)),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    'Adicione uma foto ao perfil ',
                    style: TextStyles.outfit30px700w,
                    textAlign: TextAlign.center,
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: () async {
                    _controller.getImage();
                  },
                  child: _controller.image == null
                      ? SvgPicture.asset(Assets.galleryImage.path)
                      : SizedBox(
                          width: screenSize.width * .60,
                          height: screenSize.height * .30,
                          child: Image.file(File(_controller.image!.path))),
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
        bottomNavigationBar: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: Visibility(
              visible: !_finishSignUpController.pageState.value.isLoading,
              replacement: const SizedBox(
                height: 50,
                child: Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primary,
                  ),
                ),
              ),
              child: CustomButton(
                onPressed: _controller.isButtonReady
                    ? () async {
                        await _finishSignUpController.sendUserData();

                        Modular.to.pushNamed('/start/home/');
                      }
                    : null,
                label: "Enviar",
              ),
            ),
          ),
        ),
      ),
    );
  }
}
