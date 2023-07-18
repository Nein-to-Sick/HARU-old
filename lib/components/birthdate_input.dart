import 'package:cap_stone_project/pages/self_diagnosis/provider/user_info_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:provider/provider.dart';

void birthDateInput(BuildContext context) async {
  final userInfoModel = Provider.of<UserInfoValueModel>(context, listen: false);
  DateTime? selectedDate = (userInfoModel.birthday == null)
      ? DateTime.now()
      : userInfoModel.birthday;

  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        child: Container(
          height: 300,
          width: 800,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
            borderRadius: BorderRadius.circular(50.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                '생일을 입력해주세요',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                ),
              ),
              DatePickerWidget(
                looping: false,
                firstDate: DateTime(1900, 01, 01),
                lastDate: DateTime.now(),
                initialDate: userInfoModel.birthday,
                dateFormat: "yyyy-MM-dd",
                locale: DatePicker.localeFromString('KO'),
                onChange: (DateTime newDate, _) {
                  userInfoModel.userBirthDateUpdate(newDate);
                  selectedDate = newDate;
                },
                pickerTheme: DateTimePickerTheme(
                  itemTextStyle:
                      const TextStyle(color: Colors.black, fontSize: 20),
                  dividerColor: Theme.of(context).colorScheme.primary,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  userInfoModel.userBirthDateUpdate(selectedDate);
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary),
                child: const Text(
                  "확인",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
