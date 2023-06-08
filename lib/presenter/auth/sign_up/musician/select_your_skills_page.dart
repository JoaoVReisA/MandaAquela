import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:manda_aquela/color_schemes.g.dart';
import 'package:manda_aquela/domain/entities/skill.dart';
import 'package:manda_aquela/presenter/auth/sign_up/controllers/select_your_skills_page_controller.dart';
import 'package:manda_aquela/presenter/auth/widgets/skill_card.dart';
import 'package:manda_aquela/presenter/common/assets.dart';
import 'package:manda_aquela/presenter/common/text_styles.dart';
import 'package:manda_aquela/presenter/widgets/custom_button/custom_button.dart';

class SelectYourSkillsPage extends StatefulWidget {
  const SelectYourSkillsPage({super.key});

  @override
  State<SelectYourSkillsPage> createState() => _SelectYourSkillsPageState();
}

class _SelectYourSkillsPageState extends State<SelectYourSkillsPage> {
  final _controller = Modular.get<SelectYourSkillsPageController>();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _controller.getSkillsList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: Text(
            'Selecione as suas habilidades',
            style: TextStyles.outfit15pxBold.copyWith(
              color: AppColors.tertiary,
            ),
            textAlign: TextAlign.center,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SafeArea(
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
                  'Selecione suas habilidades',
                  textAlign: TextAlign.start,
                  style:
                      TextStyles.outfit15px400w.copyWith(color: Colors.black),
                ),
                const SizedBox(
                  height: 24,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextFormField(
                    onChanged: _controller.onChangedInputText,
                    decoration: InputDecoration(
                      label: const Text('Busque aqui'),
                      suffixIcon: Image.asset(Assets.guitarIcon.path),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ..._controller.filteredList.map(
                          (e) => SkillCard(
                            skill: Skill(
                              skillName: e.skillName,
                              isSelected: e.isSelected,
                            ),
                            onTap: () {
                              e.isSelected = !e.isSelected;
                              _controller.selectElement(e);
                              setState(() {});
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: CustomButton(
              onPressed: _controller.isButtonReady
                  ? () async {
                      _controller.selectedList();

                      Modular.to.pushNamed('/auth/musician_description');
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
