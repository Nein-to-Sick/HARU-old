import 'package:cap_stone_project/pages/self_diagnosis/provider/user_info_model.dart';
import 'package:cap_stone_project/pages/self_diagnosis/question_pages/additional_question_pages/additional_question_start_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    String userNickName =
        Provider.of<UserInfoValueModel>(context, listen: false).userNickName;
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
              const Text(
                '"씨앗"',
                style: TextStyle(
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
              Navigator.of(context).push(additionalQuestionPage());
            },
            child: const Text(
              '더 정확한 결과를 위해 추가질문 답하기',
              style: TextStyle(
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
