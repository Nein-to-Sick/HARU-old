import 'package:cap_stone_project/provider/statisticState.dart';
import 'package:cap_stone_project/services/database_service.dart';
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
    return const DraggableSheet();
  }
}

class DraggableSheet extends StatelessWidget {
  const DraggableSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final statisticState = Provider.of<StatisticState>(context);
    var sheetHeight = statisticState.height;
    var selectedDate = statisticState.selectedDate;

    int daysInMonth(DateTime date) {
      return DateTime(date.year, date.month + 1, 0).day;
    }

    int firstDayOfMonthIndex(DateTime date) {
      return DateTime(date.year, date.month, 1).weekday;
    }

    bool showTableCalendar = sheetHeight > 131;

    final currDate = statisticState.currentDate;
    final daysThisMonth = daysInMonth(currDate);
    final firstDayIndex = firstDayOfMonthIndex(currDate) - 1;
    final totalGridItems = daysThisMonth + firstDayIndex + 1;
    final yearAndMonthText = Padding(
      padding: const EdgeInsets.only(left: 16.0, bottom: 20),
      child: Row(
        children: [
          IconButton(
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              onPressed: () {
                statisticState.selectCurrentDate(DateTime(
                    currDate.month == 1 ? currDate.year - 1 : currDate.year,
                    currDate.month == 1 ? 12 : currDate.month - 1,
                    1));
              },
              icon: const Icon(Icons.arrow_back_ios)),
          Align(
              alignment: Alignment.topLeft,
              child: Text(
                '${currDate.year} / ${currDate.month}',
                style: const TextStyle(fontSize: 25),
              )),
          IconButton(
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              onPressed: () {
                statisticState.selectCurrentDate(DateTime(
                    currDate.month == 12 ? currDate.year + 1 : currDate.year,
                    currDate.month == 12 ? 1 : currDate.month + 1,
                    1));
              },
              icon: const Icon(Icons.arrow_forward_ios)),
        ],
      ),
    );

    // Added: week days header row
    final weekDaysHeaderRow = Row(
      children: ['일', '월', '화', '수', '목', '금', '토'].map((weekDay) {
        return Expanded(child: Center(child: Text(weekDay)));
      }).toList(),
    );

    // Modified: added header as children of the column
    final tableCalendar = Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16),
      child: Column(
        children: [
          Expanded(
            child: ListView(
              physics: const NeverScrollableScrollPhysics(),
              children: [
                const SizedBox(
                  height: 30,
                ),
                yearAndMonthText,
                weekDaysHeaderRow,
                const SizedBox(
                  height: 10,
                ),
                GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 7,
                    childAspectRatio: 0.8,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    final currentDate = DateTime(
                        currDate.year, currDate.month, index - firstDayIndex);
                    return FutureBuilder<bool>(
                      future: DatabaseService().checkDate(currentDate),
                      builder: (BuildContext context,
                          AsyncSnapshot<dynamic> snapshot) {
                        if (snapshot.hasData) {
                          //보류
                          // if (snapshot.connectionState == ConnectionState.none) {
                          //   return Stack(
                          //     children: [
                          //       currentDate.month == selectedDate.month &&
                          //           currentDate.day == selectedDate.day
                          //           ? Center(
                          //         child: Container(
                          //           width: 46,
                          //           decoration: BoxDecoration(
                          //               color: Colors.grey.shade300,
                          //               borderRadius:
                          //               BorderRadius.circular(15)),
                          //         ),
                          //       )
                          //           : Container(),
                          //       GestureDetector(
                          //         onTap: () {
                          //           statisticState.selectDate(DateTime(
                          //               currentDate.year,
                          //               currentDate.month,
                          //               currentDate.day));
                          //           DatabaseService().averageFace(currentDate);
                          //         },
                          //         child: Center(
                          //           child: Container(
                          //             color: Colors.transparent,
                          //             child: FutureBuilder<int>(
                          //               future: DatabaseService()
                          //                   .averageFace(currentDate),
                          //               builder: (BuildContext context,
                          //                   AsyncSnapshot<dynamic> snapshot) {
                          //                 if (snapshot.hasData) {
                          //                   final int faceAverage = snapshot.data;
                          //                   return Column(
                          //                     mainAxisAlignment:
                          //                     MainAxisAlignment.center,
                          //                     children: [
                          //                       const SizedBox(
                          //                         height: 3,
                          //                       ),
                          //                       Text(
                          //                         currentDate.month ==
                          //                             DateTime.now()
                          //                                 .month &&
                          //                             currentDate.day ==
                          //                                 DateTime.now().day
                          //                             ? '오늘'
                          //                             : '${currentDate.day}',
                          //                         style: TextStyle(
                          //                             fontSize: 16,
                          //                             color: index <=
                          //                                 firstDayIndex
                          //                                 ? Colors.grey.shade300
                          //                                 : Colors.black,
                          //                             fontWeight: currentDate
                          //                                 .month ==
                          //                                 selectedDate
                          //                                     .month &&
                          //                                 currentDate.day ==
                          //                                     selectedDate.day
                          //                                 ? FontWeight.w600
                          //                                 : FontWeight.normal),
                          //                       ),
                          //                     ],
                          //                   );
                          //                 } else {
                          //                   return Container();
                          //                 }
                          //               },
                          //             ),
                          //           ),
                          //         ),
                          //       ),
                          //     ],
                          //   );
                          // }
                          final bool isDate = snapshot.data;
                          return Stack(
                            children: [
                              currentDate.month == selectedDate.month &&
                                      currentDate.day == selectedDate.day
                                  ? Center(
                                      child: Container(
                                        width: 46,
                                        decoration: BoxDecoration(
                                            color: Colors.grey.shade300,
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                      ),
                                    )
                                  : Container(),
                              GestureDetector(
                                onTap: () {
                                  statisticState.selectDate(DateTime(
                                      currentDate.year,
                                      currentDate.month,
                                      currentDate.day));
                                  DatabaseService().averageFace(currentDate);
                                },
                                child: Center(
                                  child: Container(
                                    color: Colors.transparent,
                                    child: FutureBuilder<int>(
                                      future: DatabaseService()
                                          .averageFace(currentDate),
                                      builder: (BuildContext context,
                                          AsyncSnapshot<dynamic> snapshot) {
                                        if (snapshot.hasData) {
                                          final int faceAverage = snapshot.data;
                                          return Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              isDate
                                                  ? index <= firstDayIndex
                                                      ? Opacity(
                                                          opacity: 0.2,
                                                          child: Image.asset(
                                                              "./assets/images/face$faceAverage.png",
                                                              scale: 3))
                                                      : Image.asset(
                                                          "./assets/images/face$faceAverage.png",
                                                          scale: 3)
                                                  : Container(),
                                              const SizedBox(
                                                height: 3,
                                              ),
                                              Text(
                                                currentDate.month ==
                                                            DateTime.now()
                                                                .month &&
                                                        currentDate.day ==
                                                            DateTime.now().day
                                                    ? '오늘'
                                                    : '${currentDate.day}',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: index <=
                                                            firstDayIndex
                                                        ? Colors.grey.shade300
                                                        : Colors.black,
                                                    fontWeight: currentDate
                                                                    .month ==
                                                                selectedDate
                                                                    .month &&
                                                            currentDate.day ==
                                                                selectedDate.day
                                                        ? FontWeight.w600
                                                        : FontWeight.normal),
                                              ),
                                            ],
                                          );
                                        } else {
                                          return Container();
                                        }
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        } else {
                          return Container();
                        }
                      },
                    );
                  },
                  itemCount: totalGridItems,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                ),
              ],
            ),
          ),
          const Icon(Icons.keyboard_arrow_up)
        ],
      ),
    );

    var tabTextIndexSelected = statisticState.toggleIndex;

    void toggleEvent(int index) {
      statisticState.toggleEvent(index);
    }

    void selectDate(DateTime date) {
      statisticState.selectDate(date);
    }

    Widget horizontalCalender() {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            Consumer<StatisticState>(
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
                    return FutureBuilder<bool>(
                        future: DatabaseService().checkDate(date),
                        builder: (BuildContext context,
                            AsyncSnapshot<dynamic> snapshot) {
                          // 보류
                          if (snapshot.hasData) {
                            // if (snapshot.connectionState == ConnectionState.waiting) {
                            //   return GestureDetector(
                            //     onTap: () {
                            //       selectDate(date);
                            //     },
                            //     child: Padding(
                            //       padding: !isSelected
                            //           ? const EdgeInsets.only(bottom: 1.0)
                            //           : EdgeInsets.zero,
                            //       child: FutureBuilder<int>(
                            //           future: DatabaseService().averageFace(date),
                            //           builder: (BuildContext context,
                            //               AsyncSnapshot<dynamic> snapshot) {
                            //             if (snapshot.hasData) {
                            //               final int faceAverage = snapshot.data;
                            //               return Column(
                            //                 children: [
                            //                   SizedBox(
                            //                     width: 80,
                            //                     height: 50,
                            //                     child: Center(
                            //                       child: Text(
                            //                         displayText,
                            //                         style: TextStyle(
                            //                           fontSize:
                            //                           isSelected ? 20 : 15,
                            //                           color: Colors.black,
                            //                         ),
                            //                       ),
                            //                     ),
                            //                   ),
                            //                 ],
                            //               );
                            //             } else
                            //               return Container();
                            //           }),
                            //     ),
                            //   );
                            // }
                            final bool isDate = snapshot.data;
                            return GestureDetector(
                              onTap: () {
                                selectDate(date);
                              },
                              child: Padding(
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
                                                width: 80,
                                                height: 50,
                                                child: Center(
                                                  child: Text(
                                                    displayText,
                                                    style: TextStyle(
                                                      fontSize:
                                                          isSelected ? 20 : 15,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              isDate
                                                  ? isSelected
                                                      ? Image.asset(
                                                          "./assets/images/face$faceAverage.png",
                                                          scale: 2.4,
                                                        )
                                                      : Image.asset(
                                                          "./assets/images/face$faceAverage.png",
                                                          scale: 2.8,
                                                        )
                                                  : Container(),
                                            ],
                                          ),
                                        );
                                      } else
                                        return Container();
                                    }),
                              ),
                            );
                          } else
                            return Container();
                        });
                  }).toList(),
                );
              },
            ),
            const Align(
              alignment: Alignment.bottomCenter,
              child: Icon(
                Icons.keyboard_arrow_down,
              ),
            )
          ],
        ),
      );
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

    Widget missionProgress() {
      double currentValue = 60;
      return Padding(
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
          child: Column(children: [
            FAProgressBar(
              currentValue: currentValue,
              size: 30,
              maxValue: 100,
              changeColorValue: 100,
              backgroundColor: const Color(0xffEEF6EA),
              progressColor: Theme.of(context).colorScheme.primary,
              animatedDuration: const Duration(milliseconds: 300),
              direction: Axis.horizontal,
              verticalDirection: VerticalDirection.up,
              displayText: '%',
            )
          ]));
    }

    // Widget missionIng() {
    //   return SizedBox(
    //     height: 300,
    //     child: ListView.builder(
    //       physics: const NeverScrollableScrollPhysics(),
    //       shrinkWrap: true,
    //       itemCount: Mission().mission.length,
    //       itemBuilder: (context, index1) {
    //         return Column(
    //           children: [
    //             Container(
    //               decoration: BoxDecoration(
    //                 borderRadius: BorderRadius.circular(35),
    //                 color:
    //                     index1 != 2 ? Color(0xffEEF6EA) : Colors.grey.shade200,
    //               ),
    //               width: 330,
    //               child: Padding(
    //                 padding:
    //                     const EdgeInsets.only(left: 25.0, top: 10, bottom: 7),
    //                 child: Column(
    //                   crossAxisAlignment: CrossAxisAlignment.start,
    //                   children: [
    //                     Padding(
    //                       padding: const EdgeInsets.only(top: 4.0),
    //                       child: Row(
    //                         children: [
    //                           Text(
    //                             "미션 ${index1 + 1} : ",
    //                             style: const TextStyle(fontSize: 15),
    //                           ),
    //                           Text(
    //                             Mission().mission[index1][1],
    //                             style: const TextStyle(
    //                                 fontWeight: FontWeight.bold, fontSize: 15),
    //                           )
    //                         ],
    //                       ),
    //                     ),
    //                     Padding(
    //                       padding: const EdgeInsets.only(left: 3.0),
    //                       child: SizedBox(
    //                         height: 40,
    //                         child: ListView.builder(
    //                             physics: const NeverScrollableScrollPhysics(),
    //                             shrinkWrap: true,
    //                             scrollDirection: Axis.horizontal,
    //                             itemCount: Mission().mission[index1].length - 2,
    //                             itemBuilder: (context, index2) {
    //                               return Row(
    //                                 children: [
    //                                   Container(
    //                                       decoration: BoxDecoration(
    //                                         borderRadius:
    //                                             BorderRadius.circular(20),
    //                                         color: index1 != 2
    //                                             ? Theme.of(context)
    //                                                 .colorScheme
    //                                                 .primary
    //                                             : Colors.grey.shade400,
    //                                       ),
    //                                       child: Padding(
    //                                         padding: const EdgeInsets.fromLTRB(
    //                                             15, 3, 15, 3),
    //                                         child: Text(
    //                                           Mission().mission[index1]
    //                                               [index2 + 2],
    //                                           style: const TextStyle(
    //                                               color: Colors.white,
    //                                               fontSize: 15),
    //                                         ),
    //                                       )),
    //                                   const SizedBox(
    //                                     width: 10,
    //                                   )
    //                                 ],
    //                               );
    //                             }),
    //                       ),
    //                     )
    //                   ],
    //                 ),
    //               ),
    //             ),
    //             SizedBox(
    //               height: 10,
    //             )
    //           ],
    //         );
    //       },
    //     ),
    //   );
    // }

    Widget missionComplete() {
      int value = 23;
      return Column(
        children: [
          SizedBox(
            width: 165,
            height: 165,
            child: LiquidCircularProgressIndicator(
              value: value / 100,
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
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "$value개 ",
                style: const TextStyle(fontSize: 16),
              ),
              const Text(
                "완료",
                style: TextStyle(fontSize: 16, color: Color(0xff3B679B)),
              )
            ],
          )
        ],
      );
    }

    Widget radarChart() {
      final labels = ['친밀성', '건강', '전문성', '취미', '규칙성', '성실성'];
      final values = [0.6, 0.8, 0.4, 0.7, 0.5, 0.9];
      const maxValue = 1.0;
      return SizedBox(
        width: 165,
        height: 165,
        child: CustomRadarChart(
          labels: labels,
          values: values,
          maxValue: maxValue,
          lineColor: Colors.grey.shade300,
          //Color(0xffF4F4F4),
          dataPointColor: Theme.of(context).colorScheme.primary,
          dataLineColor: Theme.of(context)
              .colorScheme
              .secondary, // Add this line for the data line color
        ),
      );
    }

    return SafeArea(
      child: Column(
        children: [
          GestureDetector(
            onVerticalDragUpdate: (DragUpdateDetails details) {
              double newHeight = sheetHeight + details.delta.dy;

              if (newHeight <
                  MediaQuery.of(context).padding.top + kToolbarHeight) {
                // Add 16 pixels of padding
                newHeight = MediaQuery.of(context).padding.top + kToolbarHeight;
              } else if (newHeight >
                  MediaQuery.of(context).size.height *
                      (totalGridItems > 35 ? 0.65 : 0.56)) {
                newHeight = MediaQuery.of(context).size.height *
                    (totalGridItems > 35 ? 0.65 : 0.56);
              }

              statisticState.changeHeight(newHeight);
            },
            child: Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                height: sheetHeight,
                child: showTableCalendar ? tableCalendar : horizontalCalender(),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 24.0, right: 24),
              child: Stack(
                children: [
                  ListView(
                    children: [
                      tabTextIndexSelected == 0
                          ? Column(
                              children: [
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
                                //missionIng(),
                              ],
                            )
                          : Container(),
                      tabTextIndexSelected == 1
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                const Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "완료한 미션",
                                      style: TextStyle(fontSize: 18),
                                    )),
                                missionComplete(),
                                const SizedBox(
                                  height: 25,
                                ),
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
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30.0),
                    child: Align(alignment: Alignment.bottomCenter,child: toggleButton()),
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
