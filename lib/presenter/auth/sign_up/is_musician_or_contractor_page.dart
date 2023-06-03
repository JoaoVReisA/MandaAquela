import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:manda_aquela/color_schemes.g.dart';
import 'package:manda_aquela/domain/entities/user_type.dart';
import 'package:manda_aquela/presenter/auth/sign_up/controllers/is_musician_or_contractor_controller.dart';
import 'package:manda_aquela/presenter/auth/widgets/select_user_type_widget.dart';
import 'package:manda_aquela/presenter/common/text_styles.dart';
import 'package:manda_aquela/presenter/widgets/custom_button/custom_button.dart';

class IsMusicianOrContractorPage extends StatefulWidget {
  const IsMusicianOrContractorPage({super.key});

  @override
  State<IsMusicianOrContractorPage> createState() =>
      _IsMusicianOrContractorPageState();
}

class _IsMusicianOrContractorPageState
    extends State<IsMusicianOrContractorPage> {
  final _controller = Modular.get<IsMusicianOrContractorController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: SafeArea(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              child: Text(
                'Antes de começarmos, precisamos saber o porque está aqui',
                style: TextStyles.outfit15pxBold.copyWith(
                  color: AppColors.tertiary,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const Spacer(),
            SelectUserTypeWidget(
              userType: UserType.musician,
              isSelected: _controller.isMusicianSelected,
              onTap: _controller.toggleIsMusicianSelectedSelected,
            ),
            const SizedBox(
              height: 16,
            ),
            SelectUserTypeWidget(
              userType: UserType.contractor,
              isSelected: _controller.isContractorSelected,
              onTap: _controller.toggleIsContractorSelected,
            ),
            const SizedBox(
              height: 16,
            ),
            RichText(
              text: TextSpan(
                text: 'Eu sou: ',
                style: TextStyles.outfit15pxBold.copyWith(color: Colors.black),
                children: [
                  TextSpan(
                      text: _controller.selectionText,
                      style: TextStyles.outfit15pxBold.copyWith(
                          color: _controller.isContinueButtonReady
                              ? AppColors.success
                              : AppColors.tertiary)),
                ],
              ),
            ),
            const Spacer(),
          ],
        )),
        bottomNavigationBar: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
            child: CustomButton(
                onPressed: _controller.isContinueButtonReady
                    ? () {
                        Modular.to.pushNamed('/auth/add_image');
                      }
                    : null,
                label: 'Continuar'),
          ),
        ),
      ),
    );
  }
}
