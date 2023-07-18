import 'package:cap_stone_project/Theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator_v2/liquid_progress_indicator.dart';

import '../../../components/customRadarChart.dart';

class MonthlyStatistic extends StatelessWidget {
  const MonthlyStatistic({Key? key}) : super(key: key);

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
            borderColor: AppColors.HARUGreyscale[50] ?? Colors.white,
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
        lineColor: AppColors.HARUGreyscale[50] ?? Colors.white,
        //Color(0xffF4F4F4),
        dataPointColor: AppColors.HARUSecondary[500] ?? Colors.white,
        dataLineColor: AppColors.HARUSecondary[200] ?? Colors.white // Add this line for the data line color
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 24.0, right: 24),
        child: ListView(
          children: <Widget>[
            const SizedBox(height: 10,),

            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.HARUSecondary,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.fromLTRB(16, 5, 10, 5),
                    child: Row(
                      children: [
                        Text("23.06.18 ~ 23.07.18", style: TextStyle(fontSize: 15),),
                        SizedBox(width: 3,),
                        Icon(Icons.keyboard_arrow_down, color: Colors.white, size: 27,),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 25,),
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
        ),
      ),
    );
  }
}
