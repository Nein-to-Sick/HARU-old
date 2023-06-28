import 'package:cap_stone_project/pages/self_diagnosis/self_diagnosis_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Question2 extends StatelessWidget {
  const Question2({super.key});

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
            'data2',
            style: TextStyle(fontSize: 50),
          ),
        ),
      ),
    );
  }
}
