import 'package:cap_stone_project/Theme/color_schemes.dart';
import 'package:cap_stone_project/pages/self_diagnosis/provider/user_info_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BodyInfo extends StatelessWidget {
  const BodyInfo({super.key});

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
      padding: const EdgeInsets.only(left: 45, right: 45, top: 100),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            width: 325,
            child: Text(
              '신장을 입력해주세요 (선택)',
              style: TextStyle(fontSize: 23),
              textAlign: TextAlign.center,
              textWidthBasis: TextWidthBasis.parent,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          //  height textfield
          TextFormField(
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
          const SizedBox(
            height: 40,
          ),
          const SizedBox(
            width: 325,
            child: Text(
              '체중을 입력해주세요 (선택)',
              style: TextStyle(fontSize: 23),
              textAlign: TextAlign.center,
              textWidthBasis: TextWidthBasis.parent,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          //  weight textfield
          TextFormField(
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
        ],
      ),
    );
  }
}
