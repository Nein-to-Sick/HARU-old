import 'package:cap_stone_project/components/radio_buttons.dart';
import 'package:flutter/material.dart';

class Question1 extends StatelessWidget {
  const Question1({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RichText(
          text: TextSpan(
            style: const TextStyle(fontSize: 20),
            children: [
              const TextSpan(
                text: '안녕하세요, ',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              TextSpan(
                text: '권세한님',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        const Text(
          '최근에 사람이 귀찮은적이 있었나요?',
          style: TextStyle(fontSize: 20),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 54,
        ),
        const RadioButtons(),
      ],
    );
  }
}
