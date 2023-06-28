import 'package:cap_stone_project/pages/self_diagnosis/self_diagnosis_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelfIntroPage extends StatelessWidget {
  const SelfIntroPage({super.key});

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
            'Nickname',
            style: TextStyle(fontSize: 50),
          ),
        ),
      ),
    );
  }
}
