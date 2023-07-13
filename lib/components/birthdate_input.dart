import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';

Future birthDateInput(BuildContext context) {
  return showDialog(
    barrierDismissible: true,
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        child: Container(
          height: 200,
          width: 750,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
            borderRadius: BorderRadius.circular(50.0),
          ),
          child: DatePickerWidget(
            looping: false, // default is not looping
            firstDate: DateTime(1900, 01, 01),
            lastDate: DateTime.now(),
            initialDate: DateTime.now(),
            dateFormat: "yyyy-MM-dd",
            //locale: DatePicker.localeFromString('en'),
            onChange: (DateTime newDate, _) {},
            //(DateTime newDate, _) => _selectedDate = newDate,
            pickerTheme: DateTimePickerTheme(
              itemTextStyle: const TextStyle(color: Colors.black, fontSize: 20),
              dividerColor: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
      );
    },
  );
}
