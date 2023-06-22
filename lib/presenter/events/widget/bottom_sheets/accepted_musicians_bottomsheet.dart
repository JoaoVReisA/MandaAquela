import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';
import 'package:manda_aquela/color_schemes.g.dart';
import 'package:manda_aquela/domain/entities/oportunity.dart';
import 'package:manda_aquela/presenter/common/text_styles.dart';
import 'package:manda_aquela/presenter/events/controller/musician_page_controller.dart';
import 'package:manda_aquela/presenter/events/widget/bottom_sheets/bottom_sheet_base.dart';
import 'package:manda_aquela/presenter/events/widget/musician_card.dart';

class AcceptedMusiciansBottomSheet extends StatefulWidget {
  const AcceptedMusiciansBottomSheet({
    super.key,
    required this.oportunities,
  });

  final List<Oportunity> oportunities;

  static Future<void> show(
      {required BuildContext context,
      required List<Oportunity> oportunities}) async {
    await showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      isScrollControlled: true,
      context: context,
      builder: (context) => AcceptedMusiciansBottomSheet(
        oportunities: oportunities,
      ),
    );
  }

  @override
  State<AcceptedMusiciansBottomSheet> createState() =>
      _AcceptedMusiciansBottomSheetState();
}

class _AcceptedMusiciansBottomSheetState
    extends State<AcceptedMusiciansBottomSheet> {
  final _controller = MusiciansPageController(
    fetchOportunityMusicians: Modular.get(),
    acceptMusicianUsecase: Modular.get(),
  );

  @override
  void initState() {
    _controller.fetchMusiciansFromOportunityList(widget.oportunities);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BottomSheetBase(
        title: 'Você aceitou',
        content: Obx(() {
          if (_controller.musicianList.isNotEmpty) {
            return ListView.builder(
              itemCount: widget.oportunities.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final oportunity = widget.oportunities[index];
                final musicianId = oportunity.musicianId;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      oportunity.name,
                      style: TextStyles.poppins14px700w
                          .copyWith(color: AppColors.gray),
                    ),
                    const SizedBox(height: 12),
                    _getTextOrMusician(_controller, oportunity, musicianId),
                    const SizedBox(height: 16)
                  ],
                );
              },
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        }));
  }

  _getTextOrMusician(
      MusiciansPageController controller, oportunity, musicianId) {
    if (musicianId == null) {
      return Text(
        'Você ainda não aceitou nenhum músico para essa oportunidade.',
        style: TextStyles.poppins10px500w,
      );
    }

    final musician = _controller.musicianList.firstWhere(
      (musician) => musician.id == musicianId,
    );

    return MusicianCard(
      oportunity: oportunity,
      musician: musician,
      onTapImage: () {
        Modular.to.pushNamed('/home/profile',
            arguments: _controller.buildUserModelFromMusician(musician));
      },
    );
  }
}
