import 'package:cap_stone_project/pages/self_diagnosis/self_introduction_pages/question_pages/question_form.dart';
import 'package:flutter/material.dart';

class Question3 extends StatelessWidget {
  const Question3({super.key});

  @override
  Widget build(BuildContext context) {
    return const QuestionFrom(
        question: '개인적인 생각을 털어놓을 주변 사람이 있나요?', tabNumber: 2);
  }
}
