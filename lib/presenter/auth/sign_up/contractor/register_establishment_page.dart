import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:manda_aquela/color_schemes.g.dart';
import 'package:manda_aquela/domain/entities/establishment_type.dart';
import 'package:manda_aquela/presenter/auth/sign_up/controllers/register_establishment_page_controller.dart';
import 'package:manda_aquela/presenter/common/assets.dart';
import 'package:manda_aquela/presenter/common/text_styles.dart';
import 'package:manda_aquela/presenter/widgets/custom_button/custom_button.dart';

class RegisterEstablishmentPage extends StatefulWidget {
  const RegisterEstablishmentPage({super.key});

  @override
  State<RegisterEstablishmentPage> createState() =>
      _RegisterEstablishmentPageState();
}

class _RegisterEstablishmentPageState extends State<RegisterEstablishmentPage> {
  final _controller = Modular.get<RegisterEstablishmentPageController>();

  @override
  void initState() {
    _controller.getEstablishmentTypes();
    super.initState();
  }

  EstablishmentType? dropdownValue;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            'Cadastre um estabelecimento',
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
                  Center(child: SvgPicture.asset(Assets.addressHouse.path)),
                  const SizedBox(
                    height: 15,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    style: TextStyles.outfit15px400w,
                    decoration: const InputDecoration(
                      hintText: "Digite o nome do estabelecimento",
                      label: Text("Digite o nome do estabelecimento"),
                    ),
                    onChanged: _controller.setEstablishmentName,
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey),
                    ),

                    //TODO: SELECIONAR VÄRIOS TIPOS DE ESTABELECIMENTO
                    child: DropdownButton<EstablishmentType>(
                      borderRadius: BorderRadius.circular(8),
                      isExpanded: true,
                      value: _controller.selectedEstablishmentType,
                      // icon: const Icon(Icons.arrow_downward),
                      elevation: 16,
                      style: const TextStyle(color: AppColors.primary),
                      onChanged: _controller.setEstablishmentType,
                      underline: Container(
                        color: Colors.transparent,
                      ),
                      items: _controller.establishmentTypes
                          .map<DropdownMenuItem<EstablishmentType>>(
                              (EstablishmentType value) {
                        return DropdownMenuItem<EstablishmentType>(
                          value: value,
                          child: Text(value.name),
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    style: TextStyles.outfit15px400w,
                    decoration: const InputDecoration(
                      hintText: "Digite o endereço",
                      label: Text("Digite o endereço"),
                    ),
                    onChanged: _controller.setAddress,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    style: TextStyles.outfit15px400w,
                    decoration: const InputDecoration(
                      hintText: "Informe a capacidade do estabelecimento",
                      label: Text("Informe a capacidade do estabelecimento"),
                    ),
                    onChanged: _controller.setCapacity,
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
              children: [
                CustomButton(
                  onPressed: _controller.isButtonReady
                      ? () async {
                          Modular.to.pushNamed('/auth/address');
                        }
                      : null,
                  label: "Enviar",
                ),
                TextButton(
                  child: const Text('Não possuo um estabelecimento',
                      style: TextStyle(decoration: TextDecoration.underline)),
                  onPressed: () {
                    Modular.to.pushNamed('/auth/address');
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
