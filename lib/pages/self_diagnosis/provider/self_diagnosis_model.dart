import 'package:flutter/material.dart';

class DiagnosisModel with ChangeNotifier {
  final totalIntroPage = 3; //  total intro page count
  final totalDiagnosisPage = 7; //  total diagnosis page count
  final totalExplainPage = 1; //  total explain page count
  int currentTabIndex; //  0 ~ total pages (9 = 1 + 7 + 1)
  int currentProgressbarIndex; //  1 ~ intro, 1 ~ diagnosis, 1 ~ explain
  int stage; //  intro = 0, diagnosis = 1, explain = 2
  bool isSelected; //  whether the radio button selected

  DiagnosisModel({
    required this.currentTabIndex,
    required this.currentProgressbarIndex,
    required this.stage,
    required this.isSelected,
  });

  void increaseProgressIndex() {
    currentTabIndex++;
    currentProgressbarIndex++;
    if (currentTabIndex == totalIntroPage) {
      stage = 1;
      currentProgressbarIndex = 1;
    } else if (currentTabIndex == totalIntroPage + totalDiagnosisPage) {
      stage = 2;
      currentProgressbarIndex = 1;
    }

    notifyListeners();
  }

  void decreaseProgressIndex() {
    currentTabIndex--;
    currentProgressbarIndex--;
    if (currentTabIndex == totalIntroPage - 1) {
      stage = 0;
      currentProgressbarIndex = totalIntroPage;
    } else if (currentTabIndex == totalIntroPage + totalDiagnosisPage - 1) {
      stage = 1;
      currentProgressbarIndex = totalDiagnosisPage;
    }

    notifyListeners();
  }

  int getTotalStagePage() {
    if (stage == 0) {
      return totalIntroPage;
    } else if (stage == 1) {
      return totalDiagnosisPage;
    } else {
      return totalExplainPage;
    }
  }

  int getTotalPageNum() {
    return totalIntroPage + totalDiagnosisPage + totalExplainPage - 1;
  }

  void recordResponse() {
    isSelected = true;
    notifyListeners();
  }

  void moveNextPage() {
    isSelected = false;
    notifyListeners();
  }
}
