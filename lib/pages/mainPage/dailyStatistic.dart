import 'package:cap_stone_project/Theme/app_colors.dart';
import 'package:cap_stone_project/pages/mainPage/statisticBody.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/sliding/sliding.dart';
import '../../components/sliding/sliding_panel_controller.dart';
import '../../provider/statisticState.dart';
import '../../services/database_service.dart';

class DailyStatistic extends StatefulWidget {
  const DailyStatistic({Key? key}) : super(key: key);

  @override
  State<DailyStatistic> createState() => _DailyStatisticState();
}

class _DailyStatisticState extends State<DailyStatistic> {
  final ValueNotifier<bool> _isPanelVisible = ValueNotifier(false);
  final SlidingPanelTopController _controller = SlidingPanelTopController();
  bool isDelayCompleted = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(listenerController);
  }

  void listenerController() {
    _isPanelVisible.value = _controller.isPanelOpen;
    if(_controller.isPanelOpen == true) {
      Future.delayed(const Duration(milliseconds: 380), () {
          isDelayCompleted = true;
      });
    } else {
      isDelayCompleted = false;
    }
  }

  // @override
  // void dispose() {
  //   _controller.removeListener(listenerController);
  //   // _controller.dispose();
  //   super.dispose();
  // }

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
              return Padding(
                padding: !isSelected
                    ? const EdgeInsets.only(bottom: 1.0)
                    : EdgeInsets.zero,
                child: FutureBuilder<int>(
                    future: DatabaseService().averageFace(date),
                    builder: (BuildContext context,
                        AsyncSnapshot<dynamic> snapshot) {
                      if (snapshot.hasData) {
                        final int faceAverage = snapshot.data;
                        return Container(
                          color: Colors.transparent,
                          child: Column(
                            children: [
                              SizedBox(
                                width: 70,
                                height: 50,
                                child: Center(
                                  child: Text(
                                    displayText,
                                    style: TextStyle(
                                      fontSize: isSelected ? 20 : 15,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                              Image.asset(
                                "./assets/images/emotion/${faceAverage + 1}.png",
                                scale: 4,
                              )
                            ],
                          ),
                        );
                      } else {
                        return Container();
                      }
                    }),
              );
            }).toList(),
          );
        },
      ),
    );
  }

  final yearAndMonthText = Row(
    children: [
      IconButton(
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
          onPressed: () {
            // statisticState.selectCurrentDate(DateTime(
            //     currDate.month == 1 ? currDate.year - 1 : currDate.year,
            //     currDate.month == 1 ? 12 : currDate.month - 1,
            //     1));
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 18,
            color: AppColors.HARUGreyscale[200],
          )),
      const Align(
          alignment: Alignment.topLeft,
          child: Text(
            '${2023} / ${07}',
            style: TextStyle(fontSize: 22),
          )),
      IconButton(
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
          onPressed: () {
            // statisticState.selectCurrentDate(DateTime(
            //     currDate.month == 12 ? currDate.year + 1 : currDate.year,
            //     currDate.month == 12 ? 1 : currDate.month + 1,
            //     1));
          },
          icon: Icon(
            Icons.arrow_forward_ios,
            size: 18,
            color: AppColors.HARUGreyscale[200],
          )),
    ],
  );

  // Added: week days header row
  final weekDaysHeaderRow = Padding(
    padding: const EdgeInsets.only(left: 15.0, right: 15.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: ['일', '월', '화', '수', '목', '금', '토'].map((weekDay) {
        return Text(
          weekDay,
          style: const TextStyle(fontSize: 13),
        );
      }).toList(),
    ),
  );

  @override
  Widget build(BuildContext context) {
    final statisticState = Provider.of<StatisticState>(context);

    int daysInMonth(DateTime date) {
      return DateTime(date.year, date.month + 1, 0).day;
    }

    int firstDayOfMonthIndex(DateTime date) {
      return DateTime(date.year, date.month, 1).weekday;
    }

    final currDate = statisticState.currentDate;
    final daysThisMonth = daysInMonth(currDate);
    final firstDayIndex = firstDayOfMonthIndex(currDate) - 1;

    Widget buildListPanel() {
      List<Widget> generateDays() {
        List<Widget> dayTiles = [];
        for (int i = 1; i <= daysThisMonth; i++) {
          dayTiles.add(GestureDetector(
            onTap: () {
              statisticState.selectCurrentDate(
                DateTime(currDate.year, currDate.month, i),
              );
            },
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color:
                    currDate.day == i ? Colors.blueAccent : Colors.transparent,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset(
                    "./assets/images/emotion/1.png",
                    scale: 5.1,
                  ),
                  Text(
                    DateTime.now().day == i ? '오늘' : "$i",
                    style: TextStyle(
                      fontSize: 13,
                      color: currDate.day == i ? Colors.white : Colors.black,
                      fontWeight: currDate.day == i
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
          ));
        }
        return dayTiles;
      }

      return Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 21),
        child: GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 7,
          // crossAxisSpacing: 20,
          mainAxisSpacing: 15,
          children: [
            ...List.generate(
                firstDayIndex,
                (index) => Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Opacity(
                              opacity: 0.2,
                              child: Image.asset(
                                "./assets/images/emotion/1.png",
                              ),
                            ),
                          ),
                          Opacity(
                            opacity: 0.2,
                            child: Text(
                              "${daysInMonth(DateTime(currDate.year, currDate.month - 1, currDate.day)) - firstDayOfMonthIndex(currDate) + 2 + index}",
                              style: const TextStyle(
                                fontSize: 13,
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
            ...generateDays(),
          ],
        ),
      );
    }

    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: Sliding(
              maxHeight: MediaQuery.of(context).size.height * 0.5,
              decorationPanel: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              controller: _controller,
              header: Container(
                color: Colors.white,
                child: ListTile(
                  title: Column(
                    children: [
                      a(),
                      const SizedBox(
                        height: 8,
                      ),
                      _buildArrowIconHeader()
                    ],
                  ),
                ),
              ),
              panel: (_) => ValueListenableBuilder<bool>(
                valueListenable: _isPanelVisible,
                builder: (BuildContext _, bool isVisible, Widget? __) {
                  return (!isVisible || !isDelayCompleted)
                      ? Container()
                      : Column(
                          children: [
                            buildListPanel(),
                            const SizedBox(
                              height: 15,
                            ),
                            GestureDetector(
                                onTap: () {
                                  _controller.close();
                                },
                                child: const Icon(Icons.keyboard_arrow_up))
                          ],
                        );
                },
              ),
              body: _buildGridList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget a() {
    return ValueListenableBuilder<bool>(
      valueListenable: _isPanelVisible,
      builder: (BuildContext _, bool isVisible, Widget? __) {
        return !isVisible
            ? horizontalCalender()
            : Column(
                children: [
                  yearAndMonthText,
                  weekDaysHeaderRow,
                ],
              );
      },
    );
  }

  Widget _buildArrowIconHeader() {
    return ValueListenableBuilder<bool>(
      valueListenable: _isPanelVisible,
      builder: (BuildContext _, bool isVisible, Widget? __) {
        return GestureDetector(
            onTap: () {
              _controller.open();

            },
            child: !isVisible
                ? Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xffE8E8E8),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.fromLTRB(5, 1, 5, 1),
                      child: Text(
                        "더보기",
                        style: TextStyle(
                            color: Color(0xff717171),
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  )
                : Container());
      },
    );
  }

  Widget _buildGridList() => const StatisticBody();
}
