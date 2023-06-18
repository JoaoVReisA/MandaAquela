import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:manda_aquela/color_schemes.g.dart';
import 'package:manda_aquela/presenter/common/assets.dart';
import 'package:manda_aquela/presenter/common/text_styles.dart';
import 'package:manda_aquela/presenter/profile/controller/profile_page_controller.dart';
import 'package:manda_aquela/presenter/profile/widgets/description_widget.dart';
import 'package:manda_aquela/presenter/profile/widgets/profile_action_button.dart';
import 'package:manda_aquela/presenter/widgets/rate/rate_notes.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _controller = Modular.get<ProfilePageController>();

  @override
  void initState() {
    _controller.getUserModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.45,
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFFAE2706),
                    AppColors.primary,
                  ],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                ),
              ),
            ),
            SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      const Spacer(),
                      IconButton(
                          onPressed: () {
                            _controller.logout();
                          },
                          icon: const Icon(
                            Icons.logout,
                            color: Colors.white,
                          )),
                    ],
                  ),
                  buildHeader(),
                  const SizedBox(
                    height: 75,
                  ),
                  getActionButtons(),
                  const SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: DescriptionWidget(
                      description: _controller.userModel?.description ?? '',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getActionButtons() {
    if (_controller.userModel?.type == 'musician') {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ProfileActionButton(
            onTap: () {},
            text: 'Contato',
            icon: const Icon(
              Icons.contact_emergency_outlined,
              color: AppColors.primary,
            ),
          ),
          ProfileActionButton(
            onTap: () {},
            text: 'Habilidades',
            icon: SvgPicture.asset(
              Assets.musicalNoteIcon.path,
              colorFilter:
                  const ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
            ),
          ),
        ],
      );
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ProfileActionButton(
          onTap: () {},
          text: 'Contato',
          icon: const Icon(
            Icons.contact_emergency_outlined,
            color: AppColors.primary,
          ),
        ),
        ProfileActionButton(
          onTap: () {},
          text: 'Estabelecimentos',
          icon: const Icon(
            Icons.cabin_outlined,
            color: AppColors.primary,
          ),
        ),
      ],
    );
  }

  Widget buildHeader() {
    return Padding(
      padding: const EdgeInsets.only(left: 24.0),
      child: Row(
        children: [
          Container(
            height: 200,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              image: _controller.userModel?.photoUrl != null
                  ? DecorationImage(
                      image: NetworkImage(
                        _controller.userModel!.photoUrl!,
                      ),
                    )
                  : null,
            ),
          ),
          const SizedBox(
            width: 24,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _controller.userModel?.name ?? 'Seu nome',
                style: TextStyles.outfit18px700w.copyWith(color: Colors.white),
              ),
              Row(
                children: [
                  Text(
                    _controller.userModel?.rate.toString() ?? '',
                    style:
                        TextStyles.outfit18px700w.copyWith(color: Colors.white),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  RateNotes(rate: _controller.userModel?.rate ?? 4),
                ],
              ),
              Text(
                _controller.userModel?.fee ?? '',
                style: TextStyles.outfit18px700w.copyWith(color: Colors.white),
              ),
              Text(
                _controller.getSkillsStrings,
                style: TextStyles.outfit15px400w.copyWith(color: Colors.grey),
              ),
            ],
          )
        ],
      ),
    );
  }
}
