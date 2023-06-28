import 'package:cap_stone_project/provider/statisticState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:flutter_radar_chart/flutter_radar_chart.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:provider/provider.dart';

import '../../components/customRadarChart.dart';

class Statistic extends StatelessWidget {
  Statistic({super.key});

  bool darkMode = false;
  bool useSides = false;
  double numberOfFeatures = 3;

  @override
  Widget build(BuildContext context) {
    final statisticState = Provider.of<StatisticState>(context);
    var tabTextIndexSelected = statisticState.toggleIndex;
    var listTextTabToggle = ["일일 통계", "전체 통계"];
    double currentValue = 60;

    void toggleEvent(int index) {
      statisticState.toggleEvent(index);
    }

    void selectDate(DateTime date) {
      statisticState.selectDate(date);
    }

    final labels = ['친밀성', '건강', '전문성', '취미', '규칙성', '성실성'];
    final values = [0.6, 0.8, 0.4, 0.7, 0.5, 0.9];
    const maxValue = 1.0;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const NeverScrollableScrollPhysics(),
              child: Consumer<StatisticState>(
                builder: (context, state, _) {
                  return Row(
                    children: state.dates.map((date) {
                      final isSelected = date == state.selectedDate;
                      String displayText;
                      if (date.year == DateTime.now().year &&
                          date.month == DateTime.now().month &&
                          date.day == DateTime.now().day) {
                        displayText = "오늘";
                      } else {
                        displayText = date.day.toString();
                      }
                      return GestureDetector(
                        onTap: () {
                          selectDate(date);
                        },
                        child: Column(
                          children: [
                            SizedBox(
                              width: 80,
                              height: 50,
                              child: Center(
                                child: Text(
                                  displayText,
                                  style: TextStyle(
                                    fontSize: isSelected ? 24 : 18,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            Image.asset(
                              "./assets/images/face4.png",
                              scale: 2.5,
                            ),
                            isSelected
                                ? const Icon(Icons.arrow_drop_down_sharp)
                                : Container(),
                          ],
                        ),
                      );
                    }).toList(),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24.0, right: 24),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  FlutterToggleTab(
                    width: 40,
                    borderRadius: 30,
                    height: 30,
                    selectedIndex: tabTextIndexSelected,
                    selectedBackgroundColors: const [
                      Colors.white,
                      Colors.white
                    ],
                    selectedTextStyle:
                        const TextStyle(color: Colors.black, fontSize: 14),
                    unSelectedTextStyle:
                        const TextStyle(color: Colors.black87, fontSize: 14),
                    labels: listTextTabToggle,
                    selectedLabelIndex: (index) {
                      toggleEvent(index);
                    },
                    isScroll: false,
                  ),
                  tabTextIndexSelected == 0
                      ? Column(
                          children: [
                            const SizedBox(height: 30),
                            const Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "미션 진행 상태",
                                  style: TextStyle(fontSize: 18),
                                )),
                            Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(0, 20, 0, 20),
                                child: Column(children: [
                                  FAProgressBar(
                                    currentValue: currentValue,
                                    size: 30,
                                    maxValue: 100,
                                    changeColorValue: 100,
                                    backgroundColor:
                                        Theme.of(context).secondaryHeaderColor,
                                    progressColor:
                                        Theme.of(context).primaryColor,
                                    animatedDuration:
                                        const Duration(milliseconds: 300),
                                    direction: Axis.horizontal,
                                    verticalDirection: VerticalDirection.up,
                                    displayText: '%',
                                  )
                                ])),
                            const SizedBox(
                              height: 30,
                            ),
                            const Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "진행중인 미션",
                                  style: TextStyle(fontSize: 18),
                                )),
                          ],
                        )
                      : Container(),
                  tabTextIndexSelected == 1 ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const SizedBox(height: 30),
                      const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "완료한 미션",
                            style: TextStyle(fontSize: 18),
                          )),
                      const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "주로 한 미션",
                            style: TextStyle(fontSize: 18),
                          )),                      SizedBox(height: 30,),
                      SizedBox(
                        width: 200,
                        height: 200,
                        child: CustomRadarChart(
                          labels: labels,
                          values: values,
                          maxValue: maxValue,
                          lineColor: Colors.grey.shade300,//Color(0xffF4F4F4),
                          dataPointColor: Theme.of(context).colorScheme.primary,
                          dataLineColor: Theme.of(context).colorScheme.secondary, // Add this line for the data line color
                        ),
                      ),
                    ],
                  ) : Container()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
