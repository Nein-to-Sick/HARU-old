import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class MyProgressIndicator extends StatelessWidget {
  const MyProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            StepProgressIndicator(
              totalSteps: 1,
              currentStep: 1,
              selectedColor: Theme.of(context).colorScheme.primary,
              unselectedColor: Theme.of(context).colorScheme.secondary,
              size: 7,
              roundedEdges: const Radius.circular(5),
              fallbackLength: 60,
            ),
            const SizedBox(
              width: 6,
            ),
            Expanded(
              child: StepProgressIndicator(
                totalSteps: 5,
                currentStep: 1,
                selectedColor: Theme.of(context).colorScheme.primary,
                unselectedColor: Theme.of(context).colorScheme.secondary,
                padding: 0,
                size: 7,
                roundedEdges: const Radius.circular(5),
              ),
            ),
            const SizedBox(
              width: 6,
            ),
            StepProgressIndicator(
              totalSteps: 1,
              currentStep: 0,
              selectedColor: Theme.of(context).colorScheme.primary,
              unselectedColor: Theme.of(context).colorScheme.secondary,
              size: 7,
              roundedEdges: const Radius.circular(5),
              fallbackLength: 60,
            ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 5.0, right: 5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '자기소개',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: false
                      ? Colors.black
                      : Theme.of(context).colorScheme.tertiary,
                ),
              ),
              Text(
                '자가진단',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: true
                      ? Colors.black
                      : Theme.of(context).colorScheme.tertiary,
                ),
              ),
              Text(
                '이용설명',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: false
                      ? Colors.black
                      : Theme.of(context).colorScheme.tertiary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// 텍스트 색상 변경 변수 추가 하기, 상태 관리!