import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:manda_aquela/color_schemes.g.dart';
import 'package:manda_aquela/presenter/auth/sign_up/controllers/social_media_page_controller.dart';
import 'package:manda_aquela/presenter/common/assets.dart';
import 'package:manda_aquela/presenter/common/text_styles.dart';
import 'package:manda_aquela/presenter/widgets/custom_button/custom_button.dart';

class SocialMediaPage extends StatefulWidget {
  const SocialMediaPage({super.key});

  @override
  State<SocialMediaPage> createState() => _SocialMediaPageState();
}

class _SocialMediaPageState extends State<SocialMediaPage> {
  final _controller = Modular.get<SocialMediaPageController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Nos informe suas redes sociais',
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
                Center(child: SvgPicture.asset(Assets.socialMediaSelect.path)),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  style: TextStyles.outfit15px400w,
                  decoration: InputDecoration(
                    hintText: "@seu_usuario",
                    label: const Text("Instagram"),
                    icon: SvgPicture.asset(Assets.instagramBlackLogo.path),
                  ),
                  onChanged: _controller.setInstagram,
                ),
                const SizedBox(
                  height: 18,
                ),
                TextFormField(
                  style: TextStyles.outfit15px400w,
                  decoration: InputDecoration(
                    hintText: "facebook.com/SeuNome",
                    label: const Text("Facebook"),
                    icon: SvgPicture.asset(Assets.facebookBlackLogo.path),
                  ),
                  onChanged: _controller.setFacebook,
                ),
                const SizedBox(
                  height: 12,
                ),
                TextFormField(
                  style: TextStyles.outfit15px400w,
                  decoration: InputDecoration(
                    hintText: "tiktok.com/seu_usuario",
                    label: const Text("TikTok"),
                    icon: SvgPicture.asset(Assets.tikTokBlackLogo.path),
                  ),
                  onChanged: _controller.setTikTok,
                ),
                const SizedBox(
                  height: 12,
                ),
                TextFormField(
                  style: TextStyles.outfit15px400w,
                  decoration: InputDecoration(
                    hintText: "youtube.com/seu_canal",
                    label: const Text("Youtube"),
                    icon: SvgPicture.asset(Assets.youtubeBlackLogo.path),
                  ),
                  onChanged: _controller.setYoutube,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  'Obs. : Todas as redes sociais são opcionais',
                  style: TextStyles.outfit15px400w.copyWith(
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
              CustomButton(
                onPressed: () async {
                  Modular.to.navigate('/start/');
                },
                label: "Enviar",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
