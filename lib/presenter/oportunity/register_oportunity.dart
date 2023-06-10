import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:manda_aquela/color_schemes.g.dart';
import 'package:manda_aquela/presenter/common/assets.dart';
import 'package:manda_aquela/presenter/common/text_styles.dart';
import 'package:manda_aquela/presenter/oportunity/register_opportunity_controller.dart';
import 'package:manda_aquela/presenter/widgets/custom_button/custom_button.dart';

class RegisterOpportunity extends StatefulWidget {
  const RegisterOpportunity({super.key});

  @override
  State<RegisterOpportunity> createState() => _RegisterOpportunityState();
}

class _RegisterOpportunityState extends State<RegisterOpportunity> {
  final _controller = Modular.get<RegisterOpportunityController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Cadastre uma oportunidade',
          style: TextStyles.outfit18px700w.copyWith(
            color: AppColors.textGrey,
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
                Center(child: SvgPicture.asset(Assets.opportunityMan.path)),
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
                    hintText: "Cidade",
                    label: Text("Cidade"),
                  ),
                  onChanged: _controller.setCity,
                ),
                const SizedBox(
                  height: 12,
                ),
                TextFormField(
                  style: TextStyles.outfit15px400w,
                  decoration: const InputDecoration(
                    hintText: "Valor",
                    label: Text("Valor"),
                  ),
                  onChanged: _controller.setValue,
                ),
                const SizedBox(
                  height: 12,
                ),
                TextFormField(
                  style: TextStyles.outfit15px400w,
                  decoration: const InputDecoration(
                    hintText: "Evento",
                    label: Text("Evento"),
                  ),
                  onChanged: _controller.setEvent,
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  style: TextStyles.outfit15px400w,
                  decoration: const InputDecoration(
                    hintText: "Categoria",
                    label: Text("Categoria"),
                  ),
                  onChanged: _controller.setCategory,
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.20,
                  child: TextFormField(
                    onChanged: _controller.setDescription,
                    maxLines: 7,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 40),
                      label: Text('Informe uma breve descrição...'),
                    ),
                  ),
                ),
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
    );
  }
}
