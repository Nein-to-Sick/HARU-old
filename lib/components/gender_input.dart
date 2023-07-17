import 'package:cap_stone_project/pages/self_diagnosis/provider/user_info_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GenderInput extends StatelessWidget {
  const GenderInput({super.key});

  @override
  Widget build(BuildContext context) {
    final userInfoModel =
        Provider.of<UserInfoValueModel>(context, listen: false);
    String selectedGender = userInfoModel.gender;

    return SizedBox(
      height: 60,
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          label: const Text('성별'),
          labelStyle:
              TextStyle(color: Theme.of(context).colorScheme.outlineVariant),
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
        ),
        value: selectedGender,
        onChanged: (gender) {
          userInfoModel.userGenderUpdate(gender);
        },
        items: const [
          DropdownMenuItem(
            value: '남성',
            child: Text('남성'),
          ),
          DropdownMenuItem(
            value: '여성',
            child: Text('여성'),
          ),
          DropdownMenuItem(
            value: '밝히고 싶지 않음',
            child: Text('밝히고 싶지 않음'),
          ),
        ],
      ),
    );
  }
}
