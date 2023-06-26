import 'package:cap_stone_project/components/next_button.dart';
import 'package:cap_stone_project/components/step_progress_indicator.dart';
import 'package:cap_stone_project/pages/self_diagnosis/question_pages/question1.dart';
import 'package:cap_stone_project/pages/self_diagnosis/question_pages/question2.dart';
import 'package:cap_stone_project/pages/self_diagnosis/question_pages/question3.dart';
import 'package:cap_stone_project/pages/self_diagnosis/question_pages/question4.dart';
import 'package:cap_stone_project/pages/self_diagnosis/question_pages/question5.dart';
import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 83.0, left: 34, right: 34),
              child: MyProgressIndicator(),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 34, right: 34, top: 21),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: const Icon(Icons.arrow_back),
                  ),
                  const Text(
                    '1/5',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
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
                isSelected: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


/*
모든게 상태 관리야, 상태 관리가 필요하다....!
radio 선택시 다음 버튼 활성화 및 색상 변화 애니메이션 추가 > isSelected
radio 버튼의 value 파베로 넘기기
유저 닉네임 문장에 띄우기
페이지 넘길시 위의 페이지 번호, progress bar 변화, 텍스트 색상 변화
뒤로 가기 아이콘 함수 구현
*/