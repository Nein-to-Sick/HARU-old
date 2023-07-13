import 'package:flutter/material.dart';

class ExplanationPage1 extends StatelessWidget {
  const ExplanationPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 200),
          child: SizedBox(
            width: 200,
            child: GestureDetector(
              onTap: () {},
              child: const Text(
                '앞으로 미션을 통해 소소한 성공의 경험을 쌓아가볼 거예요',
                style: TextStyle(fontSize: 23),
                textAlign: TextAlign.center,
                textWidthBasis: TextWidthBasis.parent,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          '시작하려면 버튼을 꾹 눌러주세요',
          style: TextStyle(
            fontSize: 15,
          ),
        ),
      ],
    );
  }
}
