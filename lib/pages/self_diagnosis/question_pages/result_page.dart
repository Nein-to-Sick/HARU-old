import 'package:cap_stone_project/pages/self_diagnosis/provider/user_info_model.dart';
import 'package:cap_stone_project/pages/self_diagnosis/question_pages/additional_question_pages/additional_question_start_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wrapped_korean_text/wrapped_korean_text.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    String userNickName =
        Provider.of<UserInfoValueModel>(context, listen: false).userNickName;
    //  추가 질문 후 계산 결과를 새로 반영하지 않을 꺼면 listen: false
    int userStatus = Provider.of<UserInfoValueModel>(context).userStatus;

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 180),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                text: TextSpan(
                  style: const TextStyle(fontSize: 25),
                  children: [
                    //  user nickname
                    TextSpan(
                      text: userNickName,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const TextSpan(
                      text: '님은 현재',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                (userStatus == 1)
                    ? '"씨앗"'
                    : (userStatus == 2)
                        ? '"새싹"'
                        : '"묘목"',
                style: const TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
                textWidthBasis: TextWidthBasis.parent,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                '입니다!',
                style: TextStyle(fontSize: 23),
                textAlign: TextAlign.center,
                textWidthBasis: TextWidthBasis.parent,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 25),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                additionalQuestionPage(
                  Provider.of<UserInfoValueModel>(context, listen: false),
                ),
              );
            },
            child: WrappedKoreanText(
              '더 정확한 결과를 위해 추가질문 답하기',
              style: const TextStyle(
                color: Color(0xFF717171),
                decoration: TextDecoration.underline,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
