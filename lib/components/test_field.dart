import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final int validatorType;
  final TextEditingController? passwordcheck;

  const MyTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.obscureText,
      required this.validatorType,
      this.passwordcheck});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return '입력값을 작성하셔야 합니다.';
        } else if (validatorType == 1 &&
            !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                .hasMatch(value!.trim())) {
          return "정확한 이메일 형식으로 입력해주세요!";
        } else if (validatorType == 2 && value.length < 6) {
          return "비민번호는 최소 6글자 이상이여야 합니다.";
        } else if (validatorType == 3) {
          // if (passwordcheck!.value.length <= 6) {
          //   return "비민번호는 최소 7글자 이상이여야 합니다.";
          // } else
          if (value.length <= 6 ||
              value.toString() != passwordcheck!.value.toString()) {
            return "비민번호의 값이 다릅니다.";
          }
        }

        return null;
      },
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFC2E3AD)),
          borderRadius: BorderRadius.circular(50.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF619F70)),
          borderRadius: BorderRadius.circular(50.0),
        ),
        fillColor: Colors.white,
        filled: true,
        hintText: hintText,
        hintStyle: TextStyle(
          color: Color(0xFF717171),
        ),
      ),
    );
  }
}
