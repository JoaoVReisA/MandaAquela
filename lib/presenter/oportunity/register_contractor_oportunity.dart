import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:manda_aquela/color_schemes.g.dart';
import 'package:manda_aquela/domain/entities/event.dart';
import 'package:manda_aquela/domain/entities/music_style.dart';
import 'package:manda_aquela/presenter/common/assets.dart';
import 'package:manda_aquela/presenter/common/text_styles.dart';
import 'package:manda_aquela/presenter/oportunity/register_contractor_opportunity_controller.dart';
import 'package:manda_aquela/presenter/widgets/custom_button/custom_button.dart';
import 'package:manda_aquela/presenter/widgets/custom_date_picker.dart';
import 'package:manda_aquela/presenter/widgets/date_picker_widget.dart';

class RegisterOpportunity extends StatefulWidget {
  const RegisterOpportunity({super.key});

  @override
  State<RegisterOpportunity> createState() => _RegisterOpportunityState();
}

class _RegisterOpportunityState extends State<RegisterOpportunity> {
  final _controller = Modular.get<RegisterOpportunityController>();

  @override
  void initState() {
    _controller.getMusicStyles();
    _controller.fetchUserEventsList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
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
                  DatePickerWidget(
                    onTap: () {
                      showCupertinoModalPopup<void>(
                        context: context,
                        builder: (BuildContext context) => CustomDatePicker(
                          onTapCancel: () {
                            Modular.to.pop();
                          },
                          onTapNext: () {
                            Modular.to.pop();
                          },
                          child: CupertinoDatePicker(
                            initialDateTime:
                                _controller.dateTime ?? DateTime.now(),
                            mode: CupertinoDatePickerMode.date,
                            use24hFormat: true,
                            onDateTimeChanged: _controller.setOpportunityDate,
                          ),
                        ),
                      );
                    },
                    dateTime: _controller.dateTime,
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
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: DropdownButton<Events>(
                      borderRadius: BorderRadius.circular(8),
                      isExpanded: true,
                      value: _controller.selectedEvent,
                      elevation: 16,
                      style: const TextStyle(color: AppColors.primary),
                      onChanged: _controller.setEvent,
                      underline: Container(
                        color: Colors.transparent,
                      ),
                      items: _controller.eventsList
                          .map<DropdownMenuItem<Events>>((Events value) {
                        return DropdownMenuItem<Events>(
                          value: value,
                          child: Text(value.name),
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: DropdownButton<MusicStyle>(
                      borderRadius: BorderRadius.circular(8),
                      isExpanded: true,
                      value: _controller.selectedMusicStyle,
                      elevation: 16,
                      style: const TextStyle(color: AppColors.primary),
                      onChanged: _controller.setOpportunityMusicStyle,
                      underline: Container(
                        color: Colors.transparent,
                      ),
                      items: _controller.musicStyles
                          .map<DropdownMenuItem<MusicStyle>>(
                              (MusicStyle value) {
                        return DropdownMenuItem<MusicStyle>(
                          value: value,
                          child: Text(value.name),
                        );
                      }).toList(),
                    ),
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
                      await _controller.registerOpportunity();
                      Modular.to.pop();
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
