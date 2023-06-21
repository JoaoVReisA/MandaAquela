import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';
import 'package:manda_aquela/domain/entities/oportunity.dart';
import 'package:manda_aquela/presenter/events/controller/musician_page_controller.dart';
import 'package:manda_aquela/presenter/events/widget/details_page_base.dart';
import 'package:manda_aquela/presenter/events/widget/interested_musician_card.dart';

class MusiciansPage extends StatefulWidget {
  const MusiciansPage({
    super.key,
    required this.oportunity,
  });

  final Oportunity oportunity;

  @override
  State<MusiciansPage> createState() => _MusiciansPageState();
}

class _MusiciansPageState extends State<MusiciansPage> {
  final _controller =
      MusiciansPageController(fetchOportunityMusicians: Modular.get());

  @override
  void initState() {
    _controller.initMusiciansPage(widget.oportunity.musicianInterestedIds);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => DetailsPageBase(
        title: widget.oportunity.name,
        content: Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: _controller.musicianList.length,
            itemBuilder: (context, index) => InterestedMusicianCard(
              musician: _controller.musicianList[index],
              oportunity: widget.oportunity,
            ),
          ),
        )));
  }
}
