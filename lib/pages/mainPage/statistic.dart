import 'package:cap_stone_project/pages/mainPage/dailyStatistic.dart';
import 'package:cap_stone_project/provider/statisticState.dart';
import 'package:cap_stone_project/services/database_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:liquid_progress_indicator_v2/liquid_progress_indicator.dart';
import 'package:provider/provider.dart';
import '../../components/FAProgressBar.dart';
import '../../components/customRadarChart.dart';
import 'monthlyStatistic.dart';

class Statistic extends StatelessWidget {
  const Statistic({super.key});

  @override
  Widget build(BuildContext context) {
    final statisticState = Provider.of<StatisticState>(context);
    var tabTextIndexSelected = statisticState.toggleIndex;

    void toggleEvent(int index) {
      statisticState.toggleEvent(index);
    }

    Widget toggleButton() {
      var listTextTabToggle = ["일일 통계", "전체 통계"];
      return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        elevation: 5,
        child: FlutterToggleTab(
          width: 50,
          marginSelected: const EdgeInsets.all(2),
          borderRadius: 30,
          height: 32,
          selectedIndex: tabTextIndexSelected,
          selectedBackgroundColors: const [Colors.white, Colors.white],
          selectedTextStyle: const TextStyle(color: Colors.black, fontSize: 14),
          unSelectedTextStyle:
              const TextStyle(color: Colors.black87, fontSize: 14),
          labels: listTextTabToggle,
          selectedLabelIndex: (index) {
            toggleEvent(index);
          },
          isScroll: false,
        ),
      );
    }

    return Stack(
      children: [
        tabTextIndexSelected == 0 ? DailyStatistic() : MonthlyStatistic(),
        Padding(
          padding: const EdgeInsets.only(bottom: 30.0),
          child:
              Align(alignment: Alignment.bottomCenter, child: toggleButton()),
        ),
      ],
    );
  }
}
