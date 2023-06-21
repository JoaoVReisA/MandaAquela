import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:manda_aquela/color_schemes.g.dart';
import 'package:manda_aquela/domain/entities/event_category.dart';
import 'package:manda_aquela/presenter/common/assets.dart';
import 'package:manda_aquela/presenter/common/text_styles.dart';
import 'package:manda_aquela/presenter/events/controller/register_event_controller.dart';
import 'package:manda_aquela/presenter/widgets/bottom_sheets/opotunity_bottom_sheet.dart';
import 'package:manda_aquela/presenter/widgets/custom_button/custom_button.dart';
import 'package:manda_aquela/presenter/widgets/custom_date_picker.dart';
import 'package:manda_aquela/presenter/widgets/date_picker_widget.dart';

class RegisterEvent extends StatefulWidget {
  const RegisterEvent({super.key});

  @override
  State<RegisterEvent> createState() => _SignUpEventState();
}

class _SignUpEventState extends State<RegisterEvent> {
  final _controller = Modular.get<RegisterEventController>();
  final _descriptionFocusNode = FocusNode();
  @override
  void initState() {
    _controller.getEventsCategories();
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
            'Cadastre um evento',
            style: TextStyles.outfit15pxBold.copyWith(
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
                  Center(child: SvgPicture.asset(Assets.eventGlobal.path)),
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
                            onDateTimeChanged: _controller.setDate,
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
                      hintText: "Local",
                      label: Text("Local"),
                    ),
                    onChanged: _controller.setPlace,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    style: TextStyles.outfit15px400w,
                    decoration: const InputDecoration(
                      hintText: "Informe a capacidade do evento",
                      label: Text("Informe a capacidade do evento"),
                    ),
                    onChanged: _controller.setCapacity,
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
                    child: DropdownButton<EventCategory>(
                      borderRadius: BorderRadius.circular(8),
                      isExpanded: true,
                      value: _controller.selectedCategory,
                      elevation: 16,
                      style: const TextStyle(color: AppColors.primary),
                      onChanged: _controller.setCategory,
                      underline: Container(
                        color: Colors.transparent,
                      ),
                      items: _controller.eventCategories
                          .map<DropdownMenuItem<EventCategory>>(
                              (EventCategory value) {
                        return DropdownMenuItem<EventCategory>(
                          value: value,
                          child: Text(value.name),
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.20,
                    child: TextFormField(
                      focusNode: _descriptionFocusNode,
                      onTapOutside: (_) => _descriptionFocusNode.unfocus(),
                      onChanged: _controller.setDescription,
                      maxLines: 7,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 34,
                          horizontal: 8,
                        ),
                        label: Text('Informe uma breve descrição...'),
                      ),
                    ),
                  ),
                  _controller.opportunity == null
                      ? Column(
                          children: [
                            Text(
                              'Vimos que ainda não criou uma oportunidade',
                              style: TextStyles.outfit15pxBold.copyWith(
                                color: AppColors.textGrey,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            TextButton(
                              child: const Text(
                                'Cadastrar',
                                style: TextStyle(
                                    decoration: TextDecoration.underline),
                                textAlign: TextAlign.center,
                              ),
                              onPressed: () {
                                Modular.to
                                    .pushNamed('/events/register_opportunity');
                              },
                            )
                          ],
                        )
                      : TextButton(
                          child: const Text(
                            'Oportunidade',
                            style:
                                TextStyle(decoration: TextDecoration.underline),
                            textAlign: TextAlign.center,
                          ),
                          onPressed: () {
                            showModalBottomSheet(
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(24),
                                  topRight: Radius.circular(24),
                                ),
                              ),
                              isScrollControlled: true,
                              useRootNavigator: true,
                              context: context,
                              builder: (context) {
                                return OportunityBottomSheet(
                                  oportunities: [
                                    _controller.opportunity!,
                                  ],
                                );
                              },
                            );
                          },
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
                      await _controller.registerEvent();

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
