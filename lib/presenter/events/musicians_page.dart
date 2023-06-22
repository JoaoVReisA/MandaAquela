import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';
import 'package:manda_aquela/domain/entities/oportunity.dart';
import 'package:manda_aquela/presenter/common/text_styles.dart';
import 'package:manda_aquela/presenter/events/controller/musician_page_controller.dart';
import 'package:manda_aquela/presenter/events/widget/details_page_base.dart';
import 'package:manda_aquela/presenter/events/widget/interested_musician_card.dart';
import 'package:manda_aquela/presenter/events/widget/modals/accept_modal.dart';

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
  final _controller = MusiciansPageController(
      fetchOportunityMusicians: Modular.get(),
      acceptMusicianUsecase: Modular.get());

  @override
  void initState() {
    _controller.initMusiciansPage(widget.oportunity.musicianInterestedIds);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DetailsPageBase(
        title: widget.oportunity.name,
        content: Expanded(child: Obx(() {
          if (_controller.pageState.value.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (_controller.musicianList.isEmpty) {
            return Center(
                child: Text(
              'Nenhum músico interessado',
              style: TextStyles.outfit18px400w,
            ));
          }
          return ListView.builder(
            shrinkWrap: true,
            itemCount: _controller.musicianList.length,
            itemBuilder: (context, index) => InterestedMusicianCard(
              onTapImage: () {
                Modular.to.pushNamed('/home/profile',
                    arguments: _controller.buildUserModelFromMusician(
                        _controller.musicianList[index]));
              },
              onTapAccept: () {
                AcceptMusicianModal.show(
                    context, _controller.musicianList[index], widget.oportunity,
                    () async {
                  await _controller.acceptMusician(
                    _controller.musicianList[index],
                    widget.oportunity,
                  );
                });
              },
              musician: _controller.musicianList[index],
              oportunity: widget.oportunity,
            ),
          );
        })));
  }
}
