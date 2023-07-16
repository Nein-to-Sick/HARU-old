import 'package:cap_stone_project/pages/self_diagnosis/provider/self_diagnosis_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wrapped_korean_text/wrapped_korean_text.dart';

class SubmitPage extends StatelessWidget {
  const SubmitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 200),
          child: GestureDetector(
            onTap: () {
              Provider.of<DiagnosisModel>(context, listen: false)
                  .recordResponse();
            },
            child: WrappedKoreanText(
              '설문 내용을 제출하시겠나요?',
              style: const TextStyle(fontSize: 23),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
