import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:manda_aquela/color_schemes.g.dart';
import 'package:manda_aquela/presenter/common/assets.dart';
import 'package:manda_aquela/presenter/common/text_styles.dart';
import 'package:manda_aquela/presenter/events/controller/register_event_controller.dart';
import 'package:manda_aquela/presenter/widgets/custom_button/custom_button.dart';

class RegisterEvent extends StatefulWidget {
  const RegisterEvent({super.key});

  @override
  State<RegisterEvent> createState() => _SignUpEventState();
}

class _SignUpEventState extends State<RegisterEvent> {
  final _controller = Modular.get<RegisterEventController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            'Antes de começarmos, precisamos saber o porque está aqui',
            style: TextStyles.outfit15pxBold.copyWith(
              color: AppColors.tertiary,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(child: SvgPicture.asset(Assets.eventGlobal.path)),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    style: TextStyles.outfit15px400w,
                    decoration: const InputDecoration(
                      hintText: "Nome",
                      label: Text("Nome"),
                    ),
                    onChanged: _controller.setName,
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  TextFormField(
                    style: TextStyles.outfit15px400w,
                    decoration: const InputDecoration(
                      hintText: "Selecione a data",
                      label: Text("Selecione a data"),
                    ),
                    onChanged: _controller.setDate,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  TextFormField(
                    style: TextStyles.outfit15px400w,
                    decoration: const InputDecoration(
                      hintText: "Local",
                      label: Text("Local"),
                    ),
                    onChanged: _controller.setPlace,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    style: TextStyles.outfit15px400w,
                    decoration: const InputDecoration(
                      hintText: "Informe a capacidade do evento",
                      label: Text("Informe a capacidade do evento"),
                    ),
                    onChanged: _controller.setCapacity,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    'Vimos que ainda não criou uma oportunidade',
                    style: TextStyles.outfit15pxBold.copyWith(
                      color: AppColors.textGrey,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  TextButton(
                    child: const Text(
                      'Cadastrar',
                      style: TextStyle(decoration: TextDecoration.underline),
                      textAlign: TextAlign.center,
                    ),
                    onPressed: () {
                      //TODO: GO to oportunity page
                      // Modular.to.pushNamed('/auth/social_media');
                    },
                  )
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
                      Modular.to.pop();
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
