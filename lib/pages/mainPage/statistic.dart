import 'package:cap_stone_project/provider/statisticState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:liquid_progress_indicator_v2/liquid_progress_indicator.dart';
import 'package:provider/provider.dart';

import '../../components/customRadarChart.dart';
import '../../model/mission.dart';

class Statistic extends StatelessWidget {
  const Statistic({super.key});

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

    Widget horizontalCalender() {
      return SingleChildScrollView(
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
      );
    }

    Widget toggleButton() {
      return FlutterToggleTab(
        width: 40,
        borderRadius: 30,
        height: 30,
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
      );
    }

    Widget missionProgress() {
      return Padding(
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
          child: Column(children: [
            FAProgressBar(
              currentValue: currentValue,
              size: 30,
              maxValue: 100,
              changeColorValue: 100,
              backgroundColor: Color(0xffEEF6EA),
              progressColor: Theme.of(context).colorScheme.primary,
              animatedDuration: const Duration(milliseconds: 300),
              direction: Axis.horizontal,
              verticalDirection: VerticalDirection.up,
              displayText: '%',
            )
          ]));
    }

    Widget missionIng() {
      return SizedBox(
        height: 300,
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: Mission().mission.length,
          itemBuilder: (context, index1) {
            return Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius:
                    BorderRadius.circular(35),
                    color: index1 != 2 ? Color(0xffEEF6EA) : Colors.grey.shade200,
                  ),
                  width: 330,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25.0, top: 10, bottom: 7),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 4.0),
                          child: Row(
                            children: [
                              Text(
                                "미션 ${index1 + 1} : ", style: const TextStyle(fontSize: 15),),
                              Text(Mission().mission[index1][1], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),)
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 3.0),
                          child: SizedBox(
                            height: 40,
                            child: ListView.builder(
                                physics:
                                const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                scrollDirection:
                                Axis.horizontal,
                                itemCount: Mission()
                                    .mission[index1]
                                    .length -
                                    2,
                                itemBuilder:
                                    (context, index2) {
                                  return Row(
                                    children: [
                                      Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20),
                                            color: index1 != 2 ? Theme.of(
                                                context)
                                                .colorScheme
                                                .primary : Colors.grey.shade400,
                                          ),

                                          child: Padding(
                                            padding: const EdgeInsets.fromLTRB(15, 3, 15, 3),
                                            child: Text(Mission()
                                                .mission[
                                            index1]
                                            [index2 + 2], style: TextStyle(color: Colors.white, fontSize: 15),),
                                          )),
                                      const SizedBox(
                                        width: 10,
                                      )
                                    ],
                                  );
                                }),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                )
              ],
            );
          },
        ),
      );
    }

    Widget missionComplete() {
      int value = 23;
      return Column(
        children: [
          SizedBox(
            width: 165,
            height: 165,
            child: LiquidCircularProgressIndicator(
              value: value/100,
              // Defaults to 0.5.
              valueColor: AlwaysStoppedAnimation(Colors.blue.shade200),
              // Defaults to the current Theme's accentColor.
              backgroundColor: Colors.white,
              // Defaults to the current Theme's backgroundColor.
              borderColor: Colors.grey.shade300,
              borderWidth: 5.0,
              direction: Axis.vertical,
              // The direction the liquid moves (Axis.vertical = bottom to top, Axis.horizontal = left to right). Defaults to Axis.vertical.
            ),
          ),
          const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("$value개 ", style: const TextStyle(fontSize: 16),),
              const Text("완료", style: TextStyle(fontSize: 16, color: Color(0xff3B679B)),)
            ],
          )
        ],
      );
    }

    Widget radarChart() {
      return SizedBox(
        width: 165,
        height: 165,
        child: CustomRadarChart(
          labels: labels,
          values: values,
          maxValue: maxValue,
          lineColor: Colors.grey.shade300,
          //Color(0xffF4F4F4),
          dataPointColor:
          Theme.of(context).colorScheme.primary,
          dataLineColor: Theme.of(context)
              .colorScheme
              .secondary, // Add this line for the data line color
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            GestureDetector(onVerticalDragStart: (details) {print("dd");}, child: horizontalCalender()),
            Padding(
              padding: const EdgeInsets.only(left: 24.0, right: 24),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  toggleButton(),
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
                            missionProgress(),
                            const SizedBox(
                              height: 30,
                            ),
                            const Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "진행중인 미션",
                                  style: TextStyle(fontSize: 18),
                                )),
                            const SizedBox(
                              height: 14,
                            ),
                            missionIng(),
                          ],
                        )
                      : Container(),
                  tabTextIndexSelected == 1
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const SizedBox(height: 30),
                            const Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "완료한 미션",
                                  style: TextStyle(fontSize: 18),
                                )),
                            missionComplete(),
                            const SizedBox(height: 25,),
                            const Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "주로 한 미션",
                                  style: TextStyle(fontSize: 18),
                                )),
                            const SizedBox(
                              height: 30,
                            ),
                            radarChart(),
                          ],
                        )
                      : Container()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
