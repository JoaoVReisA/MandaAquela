import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';
import 'package:manda_aquela/color_schemes.g.dart';
import 'package:manda_aquela/presenter/common/text_styles.dart';
import 'package:manda_aquela/presenter/profile/controller/profile_page_controller.dart';
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
        body: Container(
          height: MediaQuery.of(context).size.height * 0.45,
          width: double.infinity,
          color: AppColors.primary,
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Spacer(),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.logout,
                          color: Colors.white,
                        )),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: Row(
                    children: [
                      Container(
                        height: 200,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          image: DecorationImage(
                            image: NetworkImage(
                              _controller.userModel.value?.photoUrl ?? '',
                            ),
                          ),
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
                            _controller.userModel.value?.name ?? '',
                            style: TextStyles.outfit18px700w
                                .copyWith(color: Colors.white),
                          ),
                          Row(
                            children: [
                              Text(
                                _controller.userModel.value?.rate.toString() ??
                                    '',
                                style: TextStyles.outfit18px700w
                                    .copyWith(color: Colors.white),
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              RateNotes(
                                  rate: _controller.userModel.value?.rate ?? 0),
                            ],
                          ),
                          Text(
                            _controller.userModel.value?.fee ?? '',
                            style: TextStyles.outfit18px700w
                                .copyWith(color: Colors.white),
                          ),
                          Text(
                            _controller.userModel.value?.skills.toString() ??
                                '',
                            style: TextStyles.outfit18px700w
                                .copyWith(color: Colors.white),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
