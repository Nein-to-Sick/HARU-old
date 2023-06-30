import 'package:cap_stone_project/components/radio_buttons.dart';
import 'package:flutter/material.dart';
import 'package:wrapped_korean_text/wrapped_korean_text.dart';

class QuestionFrom extends StatelessWidget {
  final String question;
  final int tabNumber;
  const QuestionFrom({
    super.key,
    required this.question,
    required this.tabNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 325,
          child: WrappedKoreanText(
            question,
            style: const TextStyle(fontSize: 23),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(
          height: 54,
        ),
        RadioButtons(
          tabPage: tabNumber,
        ),
      ],
    );
  }
}
