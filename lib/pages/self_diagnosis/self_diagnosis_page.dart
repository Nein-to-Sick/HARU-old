import 'package:cap_stone_project/components/next_button.dart';
import 'package:cap_stone_project/pages/self_diagnosis/question1.dart';
import 'package:cap_stone_project/pages/self_diagnosis/question2.dart';
import 'package:cap_stone_project/pages/self_diagnosis/question3.dart';
import 'package:cap_stone_project/pages/self_diagnosis/question4.dart';
import 'package:cap_stone_project/pages/self_diagnosis/question5.dart';
import 'package:flutter/material.dart';

class SelfDiagnosisPage extends StatelessWidget {
  const SelfDiagnosisPage({super.key});

  void nextPage() {
    print("next!!");
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      initialIndex: 0,
      child: Scaffold(
        body: Column(
          children: [
            const Expanded(
              child: TabBarView(
                //physics: NeverScrollableScrollPhysics(),
                children: [
                  Question1(),
                  Question2(),
                  Question3(),
                  Question4(),
                  Question5(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 66, left: 29, right: 29),
              child: NextButton(
                onTap: nextPage,
                text: '다음',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
