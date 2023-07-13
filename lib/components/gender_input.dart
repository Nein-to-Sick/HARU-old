import 'package:flutter/material.dart';

class GenderInput extends StatelessWidget {
  const GenderInput({super.key});

  @override
  Widget build(BuildContext context) {
    String selectedGender = "남성";

    return SizedBox(
      height: 60,
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: '성별',
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
        onChanged: (gender) {},
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
