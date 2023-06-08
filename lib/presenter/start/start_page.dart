import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:manda_aquela/presenter/common/assets.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  int currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        onTap: (id) {
          switch (id) {
            case 0:
              currentIndex = id;
              Modular.to.navigate('/start/events');
              break;
            case 1:
              currentIndex = id;
              Modular.to.navigate('/start/home');
              break;
            case 2:
              currentIndex = id;
              Modular.to.navigate('/start/profile');
              break;
          }
          setState(() {});
        },
        currentIndex: currentIndex,
        items: [
          const BottomNavigationBarItem(
              icon: Icon(Icons.featured_play_list), label: 'Eventos'),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                Assets.logo.path,
                colorFilter: ColorFilter.mode(
                    currentIndex == 1
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.outline,
                    BlendMode.srcIn),
                height: 32,
              ),
              label: 'Home'),
          const BottomNavigationBarItem(
              icon: Icon(Icons.search), label: 'Search'),
        ],
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      body: const RouterOutlet(),
    );
  }
}
