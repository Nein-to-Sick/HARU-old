import 'package:cap_stone_project/pages/mainPage/dailyStatistic.dart';
import 'package:cap_stone_project/pages/mainPage/profile.dart';
import 'package:cap_stone_project/provider/missonProvider.dart';
import 'package:cap_stone_project/provider/statisticState.dart';
import 'package:cap_stone_project/pages/mainPage/statistic.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:provider/provider.dart';
import '../../provider/navigation_controller.dart';
import 'home.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<NavigationController>(
      create: (context) => NavigationController(),
      child: Scaffold(
        body: Consumer<NavigationController>(
          builder: (context, navigationController, _) {
            return IndexedStack(
              index: navigationController.selectedIndex,
              children: [
                ChangeNotifierProvider.value(
                  value: StatisticState(),
                  child: const Statistic(),
                ),
                ChangeNotifierProvider.value(
                  value: MissionProvider(),
                  child: HomePage(),
                ),
                const ProfilePage()
              ],
            );
          },
        ),
        bottomNavigationBar: Consumer<NavigationController>(
          builder: (context, navigationController, _) {
            return BottomNavigationBar(
              unselectedItemColor: Theme.of(context)
                  .primaryColor
                  .withOpacity(0.3), // Apply opacity here

              unselectedIconTheme: IconThemeData(
                color: Theme.of(context)
                    .primaryColor
                    .withOpacity(0.3), // Apply icon opacity here
              ),
              currentIndex: navigationController.selectedIndex,
              onTap: (index) {
                navigationController.selectedIndex = index;
              },
              items: const [
                BottomNavigationBarItem(
                  icon: HeroIcon(HeroIcons.chartBar, style: HeroIconStyle.mini),
                  label: '통계',
                ),
                BottomNavigationBarItem(
                  icon: HeroIcon(HeroIcons.home, style: HeroIconStyle.mini),
                  label: '홈',
                ),
                BottomNavigationBarItem(
                  icon: HeroIcon(HeroIcons.user, style: HeroIconStyle.mini),
                  label: '프로필',
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
