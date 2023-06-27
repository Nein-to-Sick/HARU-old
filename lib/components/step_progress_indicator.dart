import 'package:cap_stone_project/pages/self_diagnosis/self_diagnosis_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class MyProgressIndicator extends StatelessWidget {
  const MyProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    int stage = Provider.of<DiagnosisModel>(context, listen: false).stage;
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
        //  three different progress bar
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //  intro page
            StepProgressIndicator(
              totalSteps: Provider.of<DiagnosisModel>(context).totalIntroPage,
              currentStep: (stage > 0)
                  ? totalIntro
                  : (stage == 0)
                      ? currentProgress
                      : 0,
              selectedColor: Theme.of(context).colorScheme.primary,
              unselectedColor: Theme.of(context).colorScheme.secondary,
              size: 7,
              roundedEdges: const Radius.circular(5),
              fallbackLength: 60,
            ),
            const SizedBox(
              width: 6,
            ),

            //  diagnosis page
            Expanded(
              child: StepProgressIndicator(
                totalSteps:
                    Provider.of<DiagnosisModel>(context).totalDiagnosisPage,
                currentStep: (stage > 1)
                    ? totalDiagnosis
                    : (stage == 1)
                        ? currentProgress
                        : 0,
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

            //  explanation page
            StepProgressIndicator(
              totalSteps: Provider.of<DiagnosisModel>(context).totalExplainPage,
              currentStep: (stage > 2)
                  ? totalExplain
                  : (stage == 2)
                      ? currentProgress
                      : 0,
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

        //  sectiom name
        Padding(
          padding: const EdgeInsets.only(left: 5.0, right: 5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '자기소개',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: (stage == 0)
                      ? Colors.black
                      : Theme.of(context).colorScheme.tertiary,
                ),
              ),
              Text(
                '자가진단',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: (stage == 1)
                      ? Colors.black
                      : Theme.of(context).colorScheme.tertiary,
                ),
              ),
              Text(
                '이용설명',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: (stage == 2)
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