import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:manda_aquela/presenter/auth/sign_up/controllers/add_image_page_controller.dart';
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
  late ImagePicker imagePicker;
  @override
  void initState() {
    imagePicker = ImagePicker();
    super.initState();
  }

  XFile? _image;

  Future<void> getImage() async {
    final image = await imagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              _image == null
                  ? InkWell(
                      onTap: () async {
                        await getImage();
                      },
                      child: SvgPicture.asset(Assets.galleryImage.path),
                    )
                  : Image.file(File(_image!.path)),
              const Spacer(),
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
                    Modular.to.navigate('/start/');
                  }
                : null,
            label: "Enviar",
          ),
        ),
      ),
    );
  }
}
