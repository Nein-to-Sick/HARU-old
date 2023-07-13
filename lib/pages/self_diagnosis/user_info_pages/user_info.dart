import 'package:cap_stone_project/components/birthdate_input.dart';
import 'package:cap_stone_project/components/gender_input.dart';
import 'package:cap_stone_project/pages/self_diagnosis/provider/user_info_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:provider/provider.dart';
import 'package:wrapped_korean_text/wrapped_korean_text.dart';

class UserInformation extends StatelessWidget {
  const UserInformation({super.key});

  @override
  Widget build(BuildContext context) {
    String userHeightData = Provider.of<UserInfoValueModel>(context).height;
    String userWeightData = Provider.of<UserInfoValueModel>(context).weight;
    final heightTextController = TextEditingController();
    final weightTextController = TextEditingController();
    heightTextController.text = (userHeightData.isEmpty) ? '' : userHeightData;
    weightTextController.text = (userWeightData.isEmpty) ? '' : userWeightData;
    FocusNode textFocusHeight = FocusNode();
    FocusNode textFocusWeight = FocusNode();
    RegExp regex = RegExp(r'^\d*\.?\d{0,2}$');

    return Padding(
      padding: const EdgeInsets.only(left: 32, right: 32, top: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text(
            ' 기본 정보를 입력해주세요',
            style: TextStyle(
              fontSize: 30,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
            textWidthBasis: TextWidthBasis.parent,
          ),
          const SizedBox(
            height: 5,
          ),
          WrappedKoreanText(
            '이를 기반으로 더욱 정확한 미션과 통계를 제공하고자 합니다',
            style: TextStyle(
              fontSize: 12,
              color: Theme.of(context).colorScheme.outlineVariant,
            ),
          ),
          const SizedBox(
            height: 20,
          ),

          //  height textfield
          SizedBox(
            height: 60,
            child: TextFormField(
              controller: heightTextController,
              keyboardType: const TextInputType.numberWithOptions(
                  signed: true, decimal: true),
              focusNode: textFocusHeight,
              autocorrect: false,
              onEditingComplete: () {
                //  In case of worng form or empty value record ''
                if (!regex.hasMatch(heightTextController.text) ||
                    heightTextController.text.isEmpty) {
                  Provider.of<UserInfoValueModel>(context, listen: false)
                      .userHeightUpdate('');
                  textFocusHeight.unfocus();
                  return;
                }
                //  else update new value
                textFocusHeight.unfocus();
                Provider.of<UserInfoValueModel>(context, listen: false)
                    .userHeightUpdate(heightTextController.text);
                heightTextController.text = userHeightData;
              },
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.only(left: 20, top: 20, bottom: 20),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.outline,
                  ),
                  borderRadius: BorderRadius.circular(50),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.primary,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(50),
                ),
                fillColor: Theme.of(context).colorScheme.background,
                filled: true,
                hintText: '신장',
                hintStyle: TextStyle(
                  color: Theme.of(context).colorScheme.outlineVariant,
                ),
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: IconButton(
                    onPressed: () {
                      heightTextController.clear;
                      Provider.of<UserInfoValueModel>(context, listen: false)
                          .userHeightUpdate('');
                      heightTextController.text = userHeightData;
                      textFocusHeight.unfocus();
                    },
                    icon: const Icon(Icons.clear),
                  ),
                ),
                suffix: Text(
                  'cm',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(
            height: 20,
          ),

          //  weight textfield
          SizedBox(
            height: 60,
            child: TextFormField(
              controller: weightTextController,
              keyboardType: const TextInputType.numberWithOptions(
                  signed: true, decimal: true),
              focusNode: textFocusWeight,
              autocorrect: false,
              onEditingComplete: () {
                //  In case of worng form or empty value record ''
                if (!regex.hasMatch(weightTextController.text) ||
                    weightTextController.text.isEmpty) {
                  Provider.of<UserInfoValueModel>(context, listen: false)
                      .userWeightUpdate('');
                  textFocusWeight.unfocus();
                  return;
                }
                //  else update new value
                textFocusWeight.unfocus();
                Provider.of<UserInfoValueModel>(context, listen: false)
                    .userWeightUpdate(weightTextController.text);
                weightTextController.text = userWeightData;
              },
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.only(left: 20, top: 20, bottom: 20),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.outline,
                  ),
                  borderRadius: BorderRadius.circular(50),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.primary,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(50),
                ),
                fillColor: Theme.of(context).colorScheme.background,
                filled: true,
                hintText: '체중',
                hintStyle: TextStyle(
                  color: Theme.of(context).colorScheme.outlineVariant,
                ),
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: IconButton(
                    onPressed: () {
                      weightTextController.clear;
                      Provider.of<UserInfoValueModel>(context, listen: false)
                          .userWeightUpdate('');
                      weightTextController.text = userWeightData;
                      textFocusWeight.unfocus();
                    },
                    icon: const Icon(Icons.clear),
                  ),
                ),
                suffix: Text(
                  'kg',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(
            height: 20,
          ),

          //  Gender selection
          GenderInput(),

          const SizedBox(
            height: 20,
          ),

          //  Birthday input
          ElevatedButton(
            onPressed: () {
              birthDateInput(context);
            },
            child: const Text('생일'),
          ),

          //  temp
          BirthdayField(),
        ],
      ),
    );
  }
}
