import 'package:cap_stone_project/pages/self_diagnosis/provider/user_info_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:provider/provider.dart';

void birthDateInput(BuildContext context) async {
  final userInfoModel = Provider.of<UserInfoValueModel>(context, listen: false);
  return showDialog(
    barrierDismissible: true,
    context: context,
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        child: Container(
          height: 300,
          width: 750,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
            borderRadius: BorderRadius.circular(50.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('생일을 입력해주세요'),
              DatePickerWidget(
                looping: false,
                firstDate: DateTime(1900, 01, 01),
                lastDate: DateTime.now(),
                initialDate: userInfoModel.birthday,
                dateFormat: "yyyy-MM-dd",
                locale: DatePicker.localeFromString('KO'),
                onChange: (DateTime newDate, _) {
                  userInfoModel.userBirthDateUpdate(newDate);
                },
                onConfirm: (DateTime newDate, _) {
                  userInfoModel.userBirthDateUpdate(newDate);
                },
                pickerTheme: DateTimePickerTheme(
                  itemTextStyle:
                      const TextStyle(color: Colors.black, fontSize: 20),
                  dividerColor: Theme.of(context).colorScheme.primary,
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

class BirthdayField extends StatefulWidget {
  const BirthdayField({super.key});

  @override
  _BirthdayFieldState createState() => _BirthdayFieldState();
}

class _BirthdayFieldState extends State<BirthdayField> {
  DateTime _selectedDate = DateTime.now();
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      keyboardType: TextInputType.datetime,
      decoration: InputDecoration(
        labelText: '생일',
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
        suffixIcon: IconButton(
          icon: const Icon(Icons.calendar_today),
          onPressed: _showDatePicker,
        ),
      ),
      readOnly: true,
      onTap: _showDatePicker,
    );
  }

  void _showDatePicker() async {
    final DateTime? date = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (date != null) {
      setState(
        () {
          _selectedDate = date;
          _controller.text =
              '${_selectedDate.year}년 / ${_selectedDate.month}월 / ${_selectedDate.day}일';
        },
      );
    }
  }
}
