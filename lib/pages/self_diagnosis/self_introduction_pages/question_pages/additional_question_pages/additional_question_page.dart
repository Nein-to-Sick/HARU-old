import 'package:cap_stone_project/pages/self_diagnosis/provider/user_info_model.dart';
import 'package:cap_stone_project/pages/self_diagnosis/user_data_database_update.dart';
import 'package:flutter/material.dart';

class AdditionalQuestionPage extends StatelessWidget {
  final UserInfoValueModel value;

  const AdditionalQuestionPage({
    super.key,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('질문'),
            const SizedBox(
              height: 25,
            ),
            IconButton(
              icon: const Icon(
                Icons.arrow_back,
                size: 50,
              ),
              onPressed: () {
                value.calculateDiagnosisResult();
                userDiagnosisResultFirebaseUpdate(value);
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
