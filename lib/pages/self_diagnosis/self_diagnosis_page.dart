import 'package:cap_stone_project/components/next_button.dart';
import 'package:cap_stone_project/components/step_progress_indicator.dart';
import 'package:cap_stone_project/pages/self_diagnosis/explanation_pages/complete_page.dart';
import 'package:cap_stone_project/pages/self_diagnosis/explanation_pages/explanation_page.dart';
import 'package:cap_stone_project/pages/self_diagnosis/question_pages/question1.dart';
import 'package:cap_stone_project/pages/self_diagnosis/question_pages/question2.dart';
import 'package:cap_stone_project/pages/self_diagnosis/question_pages/question3.dart';
import 'package:cap_stone_project/pages/self_diagnosis/question_pages/question4.dart';
import 'package:cap_stone_project/pages/self_diagnosis/question_pages/question5.dart';
import 'package:cap_stone_project/pages/self_diagnosis/self_introduction_pages/self_introduction_page.dart';
import 'package:cap_stone_project/pages/self_diagnosis/self_diagnosis_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelfDiagnosisPage extends StatelessWidget {
  const SelfDiagnosisPage({super.key});

  @override
  Widget build(BuildContext context) {
    TabController tabController = DefaultTabController.of(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //  progress bar
          const Padding(
            padding: EdgeInsets.only(top: 83.0, left: 34, right: 34),
            child: MyProgressIndicator(),
          ),

          //  back arrow icon button, page numer
          Padding(
            padding: const EdgeInsets.only(left: 34, right: 34, top: 21),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //  back arrow
                GestureDetector(
                  onTap: () {
                    if (Provider.of<DiagnosisModel>(context, listen: false)
                            .currentTabIndex >
                        0) {
                      Provider.of<DiagnosisModel>(context, listen: false)
                          .decreaseProgressIndex();
                    } else {
                      print('no more page');
                    }
                    tabController.animateTo(
                        Provider.of<DiagnosisModel>(context, listen: false)
                            .currentTabIndex);
                  },
                  child: const Icon(Icons.arrow_back),
                ),

                //  page number
                RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    children: [
                      TextSpan(
                        text: Provider.of<DiagnosisModel>(context)
                            .currentProgressbarIndex
                            .toString(),
                      ),
                      const TextSpan(
                        text: '/',
                      ),
                      TextSpan(
                        text: Provider.of<DiagnosisModel>(context)
                            .getTotalStagePage()
                            .toString(),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),

          //  diagnosis question page
          const Expanded(
            child: TabBarView(
              physics: NeverScrollableScrollPhysics(),
              children: [
                SelfIntroPage(),
                Question1(),
                Question2(),
                Question3(),
                Question4(),
                Question5(),
                ExplanationPage(),
                CompletePage(),
              ],
            ),
          ),

          //  next button
          Padding(
            padding: const EdgeInsets.only(bottom: 66, left: 29, right: 29),
            child: NextButton(
              onTap: () {
                if (Provider.of<DiagnosisModel>(context, listen: false)
                        .currentTabIndex <
                    Provider.of<DiagnosisModel>(context, listen: false)
                        .getTotalPageNum()) {
                  Provider.of<DiagnosisModel>(context, listen: false)
                      .increaseProgressIndex();
                } else {
                  print('no more page');
                }
                tabController.animateTo(
                    Provider.of<DiagnosisModel>(context, listen: false)
                        .currentTabIndex);
                Provider.of<DiagnosisModel>(context, listen: false)
                    .moveNextPage();
              },
              text: '다음',
              isSelected:
                  Provider.of<DiagnosisModel>(context, listen: false).isSelected
                      ? true
                      : false,
            ),
          ),
        ],
      ),
    );
  }
}


/*
radio 버튼의 value 파베로 넘기기, 뒤로 가기시 기본값 유지, 다음 버튼 활성화 유지
유저 닉네임 문장에 띄우기
전체적인 색상 병경에 애니메이션 효과 추가
*/