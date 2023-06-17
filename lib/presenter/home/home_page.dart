import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:manda_aquela/color_schemes.g.dart';
import 'package:manda_aquela/domain/entities/musician.dart';
import 'package:manda_aquela/domain/entities/user_firebase_info.dart';
import 'package:manda_aquela/presenter/common/assets.dart';
import 'package:manda_aquela/presenter/common/text_styles.dart';
import 'package:manda_aquela/presenter/home/home_page_controller.dart';
import 'package:manda_aquela/presenter/home/widgets/events_card.dart';
import 'package:manda_aquela/presenter/home/widgets/musician_card.dart';
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
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _controller.generateEventsAndMusiciansList();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: false,
        title: Text(
          'Olá,\n${UserFirebaseInfo.instance.name}',
          style: TextStyles.outfit18px700w.copyWith(color: AppColors.textGrey),
        ),
        elevation: 0,
        actions: [
          InkWell(
            customBorder: const CircleBorder(),
            onTap: () {
              //TODO: Go to profile page
            },
            child: Container(
              width: 60,
              height: 60,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: AppColors.primary),
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
                                onTapContacts: () {},
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
    );
  }
}
