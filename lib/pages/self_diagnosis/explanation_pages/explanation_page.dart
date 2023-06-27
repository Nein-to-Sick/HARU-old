import 'package:cap_stone_project/pages/self_diagnosis/self_diagnosis_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExplanationPage extends StatelessWidget {
  const ExplanationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Center(
        child: TextButton(
          onPressed: () {
            Provider.of<DiagnosisModel>(context, listen: false)
                .selectRadiobutton();
          },
          child: const Text(
            '이용방법 소개',
            style: TextStyle(fontSize: 50),
          ),
        ),
      ),
    );
  }
}
