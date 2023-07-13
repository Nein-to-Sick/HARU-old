import 'package:cap_stone_project/pages/self_diagnosis/provider/self_diagnosis_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:provider/provider.dart';

class AnimatedProgressBar extends StatelessWidget {
  const AnimatedProgressBar({super.key});

  @override
  Widget build(BuildContext context) {
    int stage = Provider.of<DiagnosisModel>(context).stage;
    int currentProgress = Provider.of<DiagnosisModel>(context, listen: false)
        .currentProgressbarIndex;
    int totalIntro =
        Provider.of<DiagnosisModel>(context, listen: false).totalIntroPage;
    int totalDiagnosis =
        Provider.of<DiagnosisModel>(context, listen: false).totalDiagnosisPage;
    int totalExplain =
        Provider.of<DiagnosisModel>(context, listen: false).totalExplainPage;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Flexible(
              flex: 1,
              child: FAProgressBar(
                currentValue: (stage > 0)
                    ? 100
                    : (stage == 0)
                        ? currentProgress / totalIntro * 100
                        : 0,
                maxValue: 100,
                size: 7,
                animatedDuration: const Duration(milliseconds: 300),
                backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                progressColor: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(
              width: 6,
            ),
            Flexible(
              flex: 3,
              child: FAProgressBar(
                currentValue: (stage > 1)
                    ? 100
                    : (stage == 1)
                        ? currentProgress / totalDiagnosis * 100
                        : 0,
                maxValue: 100,
                size: 7,
                animatedDuration: const Duration(milliseconds: 300),
                backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                progressColor: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(
              width: 6,
            ),
            Flexible(
              flex: 1,
              child: FAProgressBar(
                currentValue: (stage > 2)
                    ? 100
                    : (stage == 2)
                        ? currentProgress / totalExplain * 100
                        : 0,
                maxValue: 100,
                size: 7,
                animatedDuration: const Duration(milliseconds: 400),
                backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                progressColor: Theme.of(context).colorScheme.primary,
              ),
            )
          ],
        ),
        const SizedBox(
          height: 5,
        ),

        //  sectiom name
        Padding(
          padding: const EdgeInsets.only(left: 5.0, right: 5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 300),
                style: TextStyle(
                  color: (stage == 0)
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.primaryContainer,
                ),
                child: const Text(
                  '개인설정',
                  textAlign: TextAlign.center,
                ),
              ),
              AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 300),
                style: TextStyle(
                  color: (stage == 1)
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.primaryContainer,
                ),
                child: const Text(
                  '자기소개',
                  textAlign: TextAlign.center,
                ),
              ),
              AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 300),
                style: TextStyle(
                  color: (stage == 2)
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.primaryContainer,
                ),
                child: const Text(
                  '이용설명',
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
