import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:manda_aquela/color_schemes.g.dart';
import 'package:manda_aquela/presenter/auth/sign_up/controllers/musician_description_page_controller.dart';
import 'package:manda_aquela/presenter/common/assets.dart';
import 'package:manda_aquela/presenter/common/text_styles.dart';
import 'package:manda_aquela/presenter/widgets/custom_button/custom_button.dart';

class MusicianDescriptionPage extends StatefulWidget {
  const MusicianDescriptionPage({super.key});

  @override
  State<MusicianDescriptionPage> createState() =>
      _MusicianDescriptionPageState();
}

class _MusicianDescriptionPageState extends State<MusicianDescriptionPage> {
  final _controller = Modular.get<MusicianDescriptionPageController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: Text(
            'Nos informe algumas características sobre você',
            style: TextStyles.outfit15pxBold.copyWith(
              color: AppColors.tertiary,
            ),
            textAlign: TextAlign.center,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(child: SvgPicture.asset(Assets.musicianGuitar.path)),
                  const SizedBox(
                    height: 32,
                  ),
                  Text(
                    'Agora nos conte um pouco mais sobre você',
                    textAlign: TextAlign.start,
                    style:
                        TextStyles.outfit15px400w.copyWith(color: Colors.black),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.30,
                      child: TextFormField(
                        onChanged: _controller.setDescription,
                        maxLines: 7,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 40),
                          label: Text('Informe uma breve descrição...'),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: CustomButton(
              onPressed: _controller.isButtonReady
                  ? () async {
                      Modular.to.pushNamed('/auth/add_image');
                    }
                  : null,
              label: "Enviar",
            ),
          ),
        ),
      ),
    );
  }
}
