import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:manda_aquela/color_schemes.g.dart';
import 'package:manda_aquela/core/formats/currency_format.dart';
import 'package:manda_aquela/core/input_formatters/currency_input_formatter.dart';
import 'package:manda_aquela/presenter/auth/sign_up/controllers/musician_value_page_controller.dart';
import 'package:manda_aquela/presenter/common/text_styles.dart';
import 'package:manda_aquela/presenter/widgets/custom_button/custom_button.dart';

class MusicianValuePage extends StatefulWidget {
  const MusicianValuePage({super.key});

  @override
  State<MusicianValuePage> createState() => _MusicianValuePageState();
}

class _MusicianValuePageState extends State<MusicianValuePage> {
  final _controller = Modular.get<MusicianValuePageController>();
  final _focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GestureDetector(
        onTap: () {
          _focusNode.unfocus();
        },
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            title: Text(
              'Por fim nos informe qual o seu cachê',
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 32,
                  ),
                  Text(
                    'Você deve informar a Média de valor\nque você costuma cobrar',
                    textAlign: TextAlign.center,
                    style:
                        TextStyles.outfit15px400w.copyWith(color: Colors.black),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  const Spacer(),
                  Center(
                    child: SizedBox(
                      child: TextFormField(
                        focusNode: _focusNode,
                        onChanged: _controller.setMusicianValue,
                        textAlign: TextAlign.center,
                        style: TextStyles.outfit64px400wGreen,
                        initialValue: CurrencyFormats.withSymbol.format(0.0),
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          CurrencyTextFormatter(),
                        ],
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  const SizedBox(
                    height: 8,
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: SafeArea(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
              child: CustomButton(
                onPressed: _controller.isButtonReady
                    ? () async {
                        Modular.to.pushNamed('/auth/address');
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
