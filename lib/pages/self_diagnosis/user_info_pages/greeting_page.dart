import 'package:cap_stone_project/pages/self_diagnosis/provider/self_diagnosis_model.dart';
import 'package:cap_stone_project/pages/self_diagnosis/provider/user_info_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GreetingPage extends StatelessWidget {
  const GreetingPage({super.key});

  @override
  Widget build(BuildContext context) {
    String userNickName =
        Provider.of<UserInfoValueModel>(context, listen: false).userNickName;
    return GestureDetector(
      onTap: () {
        Provider.of<DiagnosisModel>(context, listen: false).recordResponse();
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RichText(
              text: TextSpan(
                style: const TextStyle(fontSize: 25),
                children: [
                  const TextSpan(
                    text: '안녕하세요 ',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),

                  //  user nickname
                  TextSpan(
                    text: userNickName,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const TextSpan(
                    text: '님',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              '$userNickName님에 대해서 조금 더 알려주세요!',
              style: const TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            )
          ],
        ),
      ),
    );
  }
}
