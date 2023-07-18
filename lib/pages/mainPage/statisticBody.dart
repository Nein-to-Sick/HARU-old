import 'package:cap_stone_project/Theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../components/FAProgressBar.dart';
import '../../provider/statisticState.dart';

class StatisticBody extends StatelessWidget {
  const StatisticBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final statisticState = Provider.of<StatisticState>(context);

    var missionClearCount = statisticState.missionClearCount;

    Widget missionProgress() {
      statisticState.clearCount();
      int days = 2;
      double currentValue = 50;
      //double currentValue = missionClearCount / 3 * 100;
      return Padding(
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
          child: Column(children: [
            FAProgressBar(
              currentValue: currentValue,
              size: 30,
              maxValue: 100,
              changeColorValue: 100,
              changeProgressColor: AppColors.HARUSecondary,
              backgroundColor: AppColors.HARUSecondary[50] ?? Colors.white,
              progressColor: AppColors.HARUSecondary,
              animatedDuration: const Duration(milliseconds: 300),
              direction: Axis.horizontal,
              verticalDirection: VerticalDirection.up,
              displayText: '%',
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  "$days ",
                  style: const TextStyle(
                      fontSize: 16, color: AppColors.HARUSecondary),
                ),
                const Text(
                  "일 연속으로 미션을 완료했어요!",
                  style: TextStyle(fontSize: 16),
                )
              ],
            )
          ]));
    }

    // Widget missionIng() {
    //   return SizedBox(
    //     height: 300,
    //     child: ListView.builder(
    //       physics: const NeverScrollableScrollPhysics(),
    //       shrinkWrap: true,
    //       itemCount: mission.length,
    //       itemBuilder: (context, index1) {
    //         return Column(
    //           children: [
    //             Container(
    //               decoration: BoxDecoration(
    //                 borderRadius: BorderRadius.circular(35),
    //                 color:
    //                 index1 != 2 ? Color(0xffEEF6EA) : Colors.grey
    //                     .shade200,
    //               ),
    //               width: 330,
    //               child: Padding(
    //                 padding:
    //                 const EdgeInsets.only(
    //                     left: 25.0, top: 10, bottom: 7),
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
    //                             mission[index1][1],
    //                             style: const TextStyle(
    //                                 fontWeight: FontWeight.bold,
    //                                 fontSize: 15),
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
    //                             itemCount: mission[index1]
    //                                 .length - 2,
    //                             itemBuilder: (context, index2) {
    //                               return Row(
    //                                 children: [
    //                                   Container(
    //                                       decoration: BoxDecoration(
    //                                         borderRadius:
    //                                         BorderRadius.circular(20),
    //                                         color: index1 != 2
    //                                             ? Theme
    //                                             .of(context)
    //                                             .colorScheme
    //                                             .primary
    //                                             : Colors.grey
    //                                             .shade400,
    //                                       ),
    //                                       child: Padding(
    //                                         padding: const EdgeInsets
    //                                             .fromLTRB(
    //                                             15, 3, 15, 3),
    //                                         child: Text(
    //                                           mission[index1]
    //                                           [index2 + 2],
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
    //
    // }

    return Padding(
      padding: const EdgeInsets.only(left: 24.0, right: 24),
      child: ListView(
        children: [
          const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "미션 진행 상태",
                style: TextStyle(fontSize: 18),
              )),
          missionProgress(),
          const SizedBox(
            height: 20,
          ),
          const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "진행중인 미션",
                style: TextStyle(fontSize: 18),
              )),
          const SizedBox(
            height: 14,
          )
        ],
      ),
    );
  }
}
