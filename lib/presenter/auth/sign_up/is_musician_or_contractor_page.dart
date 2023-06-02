import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    //TODO: ADD on Dependencie injection
    final controller = IsMusicianOrContractorController();
    return Scaffold(
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
          Obx(
            () => SelectUserTypeWidget(
              userType: UserType.musician,
              isSelected: controller.isMusicianSelected,
              onTap: () => controller.setIsMusicianSelectedSelected(
                  !controller.isMusicianSelected),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Obx(
            () => SelectUserTypeWidget(
              userType: UserType.contractor,
              isSelected: controller.isContractorSelected,
              onTap: () => controller
                  .setIsContractorSelected(!controller.isContractorSelected),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            'Eu sou:  ',
            style: TextStyles.outfit15pxBold,
          ),
          const Spacer(),
        ],
      )),
      bottomNavigationBar: SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(16),
            child: CustomButton(onPressed: () {}, label: 'Continuar')),
      ),
    );
  }
}
