import 'package:cap_stone_project/components/animated_step_progress_indidator.dart';
import 'package:cap_stone_project/components/next_button.dart';
import 'package:cap_stone_project/components/start_button.dart';
import 'package:cap_stone_project/pages/self_diagnosis/explanation_pages/complete_page.dart';
import 'package:cap_stone_project/pages/self_diagnosis/explanation_pages/explanation_page1.dart';
import 'package:cap_stone_project/pages/self_diagnosis/provider/hobbies_model.dart';
import 'package:cap_stone_project/pages/self_diagnosis/provider/user_info_model.dart';
import 'package:cap_stone_project/pages/self_diagnosis/self_introduction_pages/hobbies_keyword_select_pages/select_hobbies.dart';
import 'package:cap_stone_project/pages/self_diagnosis/self_introduction_pages/question_pages/result_page.dart';
import 'package:cap_stone_project/pages/self_diagnosis/self_introduction_pages/question_pages/submit_page.dart';
import 'package:cap_stone_project/pages/self_diagnosis/user_info_pages/greeting_page.dart';
import 'package:cap_stone_project/pages/self_diagnosis/self_introduction_pages/question_pages/question1.dart';
import 'package:cap_stone_project/pages/self_diagnosis/self_introduction_pages/question_pages/question2.dart';
import 'package:cap_stone_project/pages/self_diagnosis/self_introduction_pages/question_pages/question3.dart';
import 'package:cap_stone_project/pages/self_diagnosis/self_introduction_pages/question_pages/question4.dart';
import 'package:cap_stone_project/pages/self_diagnosis/self_introduction_pages/question_pages/question5.dart';
import 'package:cap_stone_project/pages/self_diagnosis/user_info_pages/user_info.dart';
import 'package:cap_stone_project/pages/self_diagnosis/user_data_database_update.dart';
import 'package:cap_stone_project/pages/self_diagnosis/user_info_pages/user_nickname_info_page.dart';
import 'package:cap_stone_project/pages/self_diagnosis/provider/self_diagnosis_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'explanation_pages/explanation_page2.dart';
import 'explanation_pages/explanation_page3.dart';

class SelfDiagnosisPage extends StatelessWidget {
  const SelfDiagnosisPage({super.key});

  @override
  Widget build(BuildContext context) {
    var padding = MediaQuery.of(context).padding;
    int greetingPageIndex =
        Provider.of<DiagnosisModel>(context, listen: false).totalIntroPage - 1;
    int resultPageindex = greetingPageIndex +
        Provider.of<DiagnosisModel>(context, listen: false).totalDiagnosisPage -
        1;

    TabController tabController = DefaultTabController.of(context);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height -
                padding.top -
                padding.bottom,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //  progress bar
                const Padding(
                  padding: EdgeInsets.only(top: 33.0, left: 34, right: 34),
                  child: AnimatedProgressBar(),
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
                          //  After submitied you can't go back
                          if (Provider.of<DiagnosisModel>(context,
                                          listen: false)
                                      .currentTabIndex !=
                                  resultPageindex + 1 &&
                              Provider.of<DiagnosisModel>(context,
                                          listen: false)
                                      .currentTabIndex !=
                                  0) {
                            if (Provider.of<DiagnosisModel>(context,
                                        listen: false)
                                    .currentTabIndex >
                                0) {
                              Provider.of<DiagnosisModel>(context,
                                      listen: false)
                                  .decreaseProgressIndex();
                            } else {
                              print('no more page');
                            }
                            if (Provider.of<DiagnosisModel>(context,
                                        listen: false)
                                    .currentTabIndex !=
                                0) {
                              Provider.of<DiagnosisModel>(context,
                                      listen: false)
                                  .recordResponse();
                            }
                            tabController.animateTo(Provider.of<DiagnosisModel>(
                                    context,
                                    listen: false)
                                .currentTabIndex);
                          }
                        },
                        child: Icon(
                          Icons.arrow_back,
                          color: (Provider.of<DiagnosisModel>(context,
                                              listen: false)
                                          .currentTabIndex !=
                                      resultPageindex + 1 &&
                                  Provider.of<DiagnosisModel>(context,
                                              listen: false)
                                          .currentTabIndex !=
                                      0)
                              ? Colors.black
                              : Colors.white.withOpacity(0),
                        ),
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
                      //  Intro page
                      SelfIntroPage(),
                      UserInformation(),
                      GreetingPage(),

                      //  Question page
                      Question1(),
                      Question2(),
                      Question3(),
                      Question4(),
                      Question5(),
                      Selecthobbies(),
                      SubmitPage(),
                      ResultPage(),

                      //  Explain page
                      ExplanationPage1(),
                      ExplanationPage2(),
                      ExplanationPage3(),
                      CompletePage(),
                    ],
                  ),
                ),

                //  skip button
                /*
                GestureDetector(
                  onTap: (Provider.of<DiagnosisModel>(context)
                              .currentTabIndex ==
                          1)
                      ? () {
                          Provider.of<DiagnosisModel>(context, listen: false)
                              .increaseProgressIndex();
                          tabController.animateTo(Provider.of<DiagnosisModel>(
                                  context,
                                  listen: false)
                              .currentTabIndex);
                        }
                      : () {},
                  child: AnimatedDefaultTextStyle(
                    duration: const Duration(milliseconds: 300),
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: (Provider.of<DiagnosisModel>(context)
                                  .currentTabIndex ==
                              1)
                          ? Theme.of(context).colorScheme.primary
                          : Colors.white.withOpacity(0),
                    ),
                    child: const Text(
                      '건너뛰기',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                
                const SizedBox(
                  height: 25,
                ),
                */

                //  next button
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 16, left: 29, right: 29),
                  child: (Provider.of<DiagnosisModel>(context)
                              .currentTabIndex >=
                          Provider.of<DiagnosisModel>(context).totalIntroPage +
                              Provider.of<DiagnosisModel>(context)
                                  .totalDiagnosisPage)
                      ?
                      //  Button for the last page to start
                      const StartButton(
                          text: '시작하기',
                        )
                      : (Provider.of<DiagnosisModel>(context).currentTabIndex ==
                              resultPageindex)
                          ?
                          //  Button for submition
                          NextButton(
                              onTap: () {
                                Provider.of<DiagnosisModel>(context,
                                        listen: false)
                                    .increaseProgressIndex();
                                tabController.animateTo(
                                    Provider.of<DiagnosisModel>(context,
                                            listen: false)
                                        .currentTabIndex);
                                //  임시 나중에 주석 풀기!
                                // Provider.of<UserInfoValueModel>(context,
                                //         listen: false)
                                //     .isSubmittedUpdate();
                                Provider.of<UserInfoValueModel>(context,
                                        listen: false)
                                    .calculateDiagnosisResult();
                                userDiagnosisResultFirebaseUpdate(
                                    Provider.of<UserInfoValueModel>(context,
                                        listen: false));
                                userInfoFirebaseUpdate(context);
                              },
                              text: '제출하기',
                              isSelected: true,
                            )
                          :
                          //  Button for move to next page
                          NextButton(
                              onTap: () {
                                if (Provider.of<DiagnosisModel>(context,
                                            listen: false)
                                        .currentTabIndex <
                                    Provider.of<DiagnosisModel>(context,
                                            listen: false)
                                        .getTotalPageNum()) {
                                  Provider.of<DiagnosisModel>(context,
                                          listen: false)
                                      .increaseProgressIndex();
                                } else {
                                  print('no more page');
                                }
                                tabController.animateTo(
                                    Provider.of<DiagnosisModel>(context,
                                            listen: false)
                                        .currentTabIndex);
                                //  except greeting page and result page index
                                if (Provider.of<DiagnosisModel>(context,
                                                listen: false)
                                            .currentTabIndex !=
                                        greetingPageIndex &&
                                    Provider.of<DiagnosisModel>(context,
                                                listen: false)
                                            .currentTabIndex !=
                                        resultPageindex &&
                                    Provider.of<DiagnosisModel>(context,
                                                listen: false)
                                            .currentTabIndex !=
                                        1) {
                                  //  In the middle of diagnosis(radio button) with already responsed
                                  if (Provider.of<DiagnosisModel>(context,
                                                  listen: false)
                                              .stage ==
                                          1 &&
                                      Provider.of<UserInfoValueModel>(context,
                                                      listen: false)
                                                  .isResponsed[
                                              Provider.of<DiagnosisModel>(
                                                          context,
                                                          listen: false)
                                                      .currentProgressbarIndex -
                                                  1] ==
                                          true) {
                                  }
                                  //  In select hobbies page with already responsed
                                  else if (Provider.of<DiagnosisModel>(context,
                                                  listen: false)
                                              .stage ==
                                          1 &&
                                      Provider.of<HobbiesModel>(context,
                                              listen: false)
                                          .containerStates
                                          .where((element) => element == true)
                                          .isNotEmpty) {
                                  } else {
                                    Provider.of<DiagnosisModel>(context,
                                            listen: false)
                                        .moveNextPage();
                                  }
                                }
                              },
                              text: '다음',
                              isSelected: Provider.of<DiagnosisModel>(context,
                                          listen: false)
                                      .isSelected
                                  ? true
                                  : false,
                            ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


/*
추가질문 페이지 구현, progress bar 추가 구현, progress bar 자가진단 질문만 담기 - 디자인 필요
닉네임 길이 제한 및 경고 메세지 추가
체중, 신장 제출 버튼 없이 '다음' 버튼에 업데이트 함수 구현해 값 파베로 넘기기 구현
추가 질문 텍스트 밑줄 수정
테마 색상 업데이트
*/