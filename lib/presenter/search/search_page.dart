import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';
import 'package:manda_aquela/color_schemes.g.dart';
import 'package:manda_aquela/domain/entities/musician.dart';
import 'package:manda_aquela/presenter/common/text_styles.dart';
import 'package:manda_aquela/presenter/home/widgets/events_card.dart';
import 'package:manda_aquela/presenter/home/widgets/musician_card.dart';
import 'package:manda_aquela/presenter/search/controller/search_page_controller.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _controller = Modular.get<SearchPageController>();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      _controller.generateEventsAndMusiciansList();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Text(
            'Buscar',
            style: TextStyles.outfit15pxBold.copyWith(
              color: AppColors.textGrey,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormField(
                onChanged: _controller.onChangeSearchInput,
                decoration: InputDecoration(
                  label: const Text('Pesquise algum músico, evento...'),
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.search),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: _controller.filteredList.length,
                    itemBuilder: (context, index) {
                      final item = _controller.filteredList[index];
                      if (item is Musician) {
                        return MusicianCard(
                          musicianName: item.name,
                          musicianRate: item.rate,
                          genres: '',
                          imageUrl: item.photoUrl ?? '',
                          musicianValue: item.fee,
                          onTapContacts: () {},
                          onTapGoToProfile: () {},
                          skills: '_controller.getSkillsString(item.skills)',
                        );
                      }
                      return EventsCard(event: item);
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
