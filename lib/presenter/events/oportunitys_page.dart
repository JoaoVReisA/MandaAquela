import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';
import 'package:manda_aquela/domain/entities/event.dart';
import 'package:manda_aquela/presenter/events/controller/musician_page_controller.dart';
import 'package:manda_aquela/presenter/events/widget/details_page_base.dart';
import 'package:manda_aquela/presenter/events/widget/oportunity_rate_card.dart';

class OportunityPage extends StatefulWidget {
  const OportunityPage({
    super.key,
    required this.event,
  });

  final Events event;

  @override
  State<OportunityPage> createState() => _OportunityPageState();
}

class _OportunityPageState extends State<OportunityPage> {
  final _controller = MusiciansPageController(
    rateEventUsecase: Modular.get(),
    fetchOportunityMusicians: Modular.get(),
    acceptMusicianUsecase: Modular.get(),
  );

  @override
  void initState() {
    _controller.fetchMusiciansFromOportunityList(widget.event.oportunities);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final oportunities = widget.event.oportunities;
    return DetailsPageBase(
        title: widget.event.name,
        content: Obx(
          () {
            if (_controller.musicianList.isNotEmpty) {
              return ListView.builder(
                itemCount: oportunities.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final oportunity = oportunities[index];
                  final musicianId = oportunity.musicianId;

                  return OportunityRateCard(
                    oportunity: oportunities[index],
                    musician: _getMusician(_controller, musicianId),
                    onTapName: _controller.buildUserModelFromMusician,
                    onSave: _controller.rateMusician,
                    event: widget.event,
                  );
                },
              );
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }

  _getMusician(MusiciansPageController controller, String? musicianId) {
    if (musicianId == null) return null;
    return controller.musicianList
        .firstWhere((element) => element.id == musicianId);
  }
}
