import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:manda_aquela/color_schemes.g.dart';
import 'package:manda_aquela/domain/entities/music_style.dart';
import 'package:manda_aquela/domain/entities/musician.dart';
import 'package:manda_aquela/domain/entities/oportunity.dart';
import 'package:manda_aquela/presenter/common/assets.dart';
import 'package:manda_aquela/presenter/common/text_styles.dart';
import 'package:manda_aquela/presenter/home/home_page_controller.dart';
import 'package:manda_aquela/presenter/home/widgets/events_card.dart';
import 'package:manda_aquela/presenter/home/widgets/musician_card.dart';
import 'package:manda_aquela/presenter/widgets/bottom_sheets/opotunity_bottom_sheet.dart';
import 'package:manda_aquela/presenter/widgets/common_dialog/signup_dialog.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = Modular.get<HomePageController>();

  @override
  void initState() {
    _controller.initHomePage();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: false,
          title: Text(
            'Olá,\n${_controller.userModel.value?.name ?? 'Usuário'}',
            style:
                TextStyles.outfit18px700w.copyWith(color: AppColors.textGrey),
          ),
          elevation: 0,
          actions: [
            InkWell(
              customBorder: const CircleBorder(),
              onTap: () {
                Modular.to.pushNamed('/home/profile');
              },
              child: SizedBox(
                width: 60,
                height: 60,
                child: CircleAvatar(
                  backgroundColor: AppColors.primary,
                  backgroundImage: _controller.userModel.value?.photoUrl != null
                      ? NetworkImage(_controller.userModel.value!.photoUrl!)
                      : null,
                ),
              ),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: [
                  SvgPicture.asset(Assets.musicalNoteIcon.path),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    'Em destaque',
                    style: TextStyles.outfit18px700w,
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Obx(
                () => !_controller.pageState.isLoading
                    ? SizedBox(
                        height: 400,
                        child: PageView.builder(
                            itemCount: _controller.eventsAndMusicianList.length,
                            itemBuilder: (context, index) {
                              final item =
                                  _controller.eventsAndMusicianList[index];
                              if (item is Musician) {
                                return MusicianCard(
                                  musicianName: item.name,
                                  musicianRate: item.rate,
                                  genres: '',
                                  imageUrl: item.imageUrl,
                                  musicianValue: item.value,
                                  onTapContacts: () {
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
                                            Oportunity(
                                                id: 'ASDSADASD',
                                                date: DateTime(2000),
                                                description: 'description',
                                                name: 'name',
                                                value: 'value',
                                                musicStyle: [
                                                  MusicStyle(
                                                      name: 'Rock', id: '1')
                                                ]),
                                            Oportunity(
                                                id: 'ASDSADASD',
                                                date: DateTime(2000),
                                                description: 'description',
                                                name: 'name',
                                                value: 'value',
                                                musicStyle: [
                                                  MusicStyle(
                                                      name: 'Rock', id: '1')
                                                ]),
                                            Oportunity(
                                                id: 'ASDSADASD',
                                                date: DateTime(2000),
                                                description: 'description',
                                                name: 'name',
                                                value: 'value',
                                                musicStyle: [
                                                  MusicStyle(
                                                      name: 'Rock', id: '1')
                                                ]),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                  onTapGoToProfile: () {},
                                  skills:
                                      '_controller.getSkillsString(item.skills)',
                                );
                              }
                              return EventsCard(event: item);
                            }),
                      )
                    : const Center(child: CircularProgressIndicator()),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => SignUpDialog(
                title: 'Cadastrar',
                bodyText:
                    'Cadastre um evento ou uma oportunidade, uma oportunidade representa um trabalho a ser oferecido. Eventos possuem oportunidades',
                labelButtonLeft: 'Evento',
                labelButtonRight: 'Oportunidade',
                onTapButtonLeft: () {
                  Modular.to.pushNamed('/events/register');
                },
                onTapButtonRight: () {
                  Modular.to.pushNamed('/home/register_opportunity');
                },
              ),
            );
          },
          backgroundColor: AppColors.primary,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
