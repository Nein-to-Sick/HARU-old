import 'package:cap_stone_project/profile.dart';
import 'package:cap_stone_project/statistic.dart';
import 'package:flutter/material.dart';

import 'home.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 1;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.index = 1;
    _tabController.addListener(() => setState(
          () => _selectedIndex = _tabController.index,
        ));
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _selectedIndex == 1
            ? HomePage()
            : _selectedIndex == 0
                ? const Statistic()
                : const Profile(),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
              border: Border(top: BorderSide(color: Colors.grey.shade200))),
          height: 90,
          child: TabBar(
            controller: _tabController,
            labelColor: Colors.black,
            indicatorColor: Theme.of(context).primaryColor,
            tabs: [
              Tab(
                  child: _selectedIndex == 0
                      ? Image.asset("./assets/images/statisticIcon_click.png")
                      : Image.asset(
                          "./assets/images/statisticIcon_unclick.png")),
              Tab(
                  child: _selectedIndex == 1
                      ? Image.asset("./assets/images/homeIcon_click.png")
                      : Image.asset("./assets/images/homeIcon_unclick.png")),
              Tab(
                  child: _selectedIndex == 2
                      ? Image.asset("./assets/images/profileIcon_click.png")
                      : Image.asset("./assets/images/profileIcon_unclick.png")),
            ],
          ),
        ));
  }

  Widget tabContainer(BuildContext con, Color tabColor, String tabText) {
    return Container(
      width: MediaQuery.of(con).size.width,
      height: MediaQuery.of(con).size.height,
      color: tabColor,
      child: Center(
        child: Text(
          tabText,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
