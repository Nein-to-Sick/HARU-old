import 'package:bubble_lens/bubble_lens.dart';
import 'package:cap_stone_project/pages/self_diagnosis/provider/hobbies_model.dart';
import 'package:cap_stone_project/pages/self_diagnosis/provider/self_diagnosis_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wrapped_korean_text/wrapped_korean_text.dart';

class Selecthobbies extends StatelessWidget {
  const Selecthobbies({super.key});

  @override
  Widget build(BuildContext context) {
    List<bool> isSelected = Provider.of<HobbiesModel>(context).containerStates;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 25, bottom: 25),
        child: Column(
          children: [
            SizedBox(
              width: 325,
              child: WrappedKoreanText(
                '평소에 좋아하거나 관심있는 것들을 모두 눌러주세요',
                style: const TextStyle(fontSize: 23),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: Container(
                color: Colors.white,
                child: BubbleLens(
                  size: 105,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 1.75,
                  duration: const Duration(milliseconds: 70),
                  widgets: [
                    for (var i = 0; i < totalLength; i++)
                      GestureDetector(
                        onTap: () {
                          Provider.of<HobbiesModel>(context, listen: false)
                              .modifyHobbiesList(i);
                          if (isSelected
                              .where((element) => element == true)
                              .isEmpty) {
                            Provider.of<DiagnosisModel>(context, listen: false)
                                .moveNextPage();
                          } else {
                            Provider.of<DiagnosisModel>(context, listen: false)
                                .recordResponse();
                          }
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 100),
                          width: 100,
                          height: 100,
                          color: isSelected[i]
                              ? Theme.of(context).colorScheme.primary
                              : Theme.of(context).colorScheme.outline,
                          child: Center(
                            child: Text(
                              hobbies[i],
                              style: TextStyle(
                                fontSize: 27,
                                color: isSelected[i]
                                    ? Theme.of(context).colorScheme.background
                                    : Colors.black,
                              ),
                            ),
                          ),
                        ),
                      )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
