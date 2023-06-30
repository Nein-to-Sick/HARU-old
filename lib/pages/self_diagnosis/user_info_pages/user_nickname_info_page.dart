import 'package:cap_stone_project/pages/self_diagnosis/provider/user_info_model.dart';
import 'package:cap_stone_project/pages/self_diagnosis/provider/self_diagnosis_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelfIntroPage extends StatelessWidget {
  const SelfIntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    String userNickNameData =
        Provider.of<UserInfoValueModel>(context).userNickName;
    final nicknameTextController = TextEditingController();
    nicknameTextController.text =
        (userNickNameData.isEmpty) ? '' : userNickNameData;
    FocusNode textFocus = FocusNode();

    return Padding(
      padding: const EdgeInsets.only(top: 160),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          RichText(
            text: TextSpan(
              style: const TextStyle(fontSize: 20),
              children: [
                const TextSpan(
                  text: '사용하실 ',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                TextSpan(
                  text: '닉네임',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                const TextSpan(
                  text: '을 정해주세요',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 45, right: 45),
            child: SizedBox(
              height: 55,
              child: TextFormField(
                focusNode: textFocus,
                autocorrect: false,
                onChanged: (value) {
                  if (value.trim().isNotEmpty) {
                    Provider.of<DiagnosisModel>(context, listen: false)
                        .recordResponse();
                  } else {
                    Provider.of<DiagnosisModel>(context, listen: false)
                        .moveNextPage();
                  }
                },
                onEditingComplete: () {
                  Provider.of<UserInfoValueModel>(context, listen: false)
                      .userNickNameUpdate(nicknameTextController.text.trim());
                  nicknameTextController.text = userNickNameData;
                  textFocus.unfocus();
                },
                controller: nicknameTextController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0xFF717171),
                    ),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.secondary,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  fillColor: Theme.of(context).colorScheme.tertiary,
                  filled: true,
                  hintText: '닉네임',
                  hintStyle: const TextStyle(
                    color: Color(0xFF717171),
                  ),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: IconButton(
                      onPressed: () {
                        nicknameTextController.clear;
                        Provider.of<UserInfoValueModel>(context, listen: false)
                            .userNickNameUpdate('');
                        nicknameTextController.text = userNickNameData;
                        textFocus.unfocus();
                        Provider.of<DiagnosisModel>(context, listen: false)
                            .moveNextPage();
                      },
                      icon: const Icon(Icons.clear),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
