import 'package:flutter/material.dart';

List<String> hobbies = [
  "음식",
  "헬스",
  "미술",
  "음악",
  "영상",
  "사진",
  "스포츠",
  "책",
  "글쓰기",
  "언어",
  "생각",
  "말하기",
  "추리",
  "비문학",
  "수학",
  "과학",
  "코딩",
  "퍼즐",
  "분석",
  "정리",
  "교류",
  "절약",
  "아날로그",
  "디지털",
  "뷰티",
  "금융",
  "영양",
];

int totalLength = hobbies.length;

class HobbiesModel with ChangeNotifier {
  List<bool> containerStates = List<bool>.filled(totalLength, false);
  List<String> addedHobbies = List.empty(growable: true);

  void modifyHobbiesList(int index) {
    containerStates[index] = !containerStates[index];
    if (containerStates[index] == true) {
      addedHobbies.add(hobbies[index]);
    } else {
      addedHobbies.remove(hobbies[index]);
    }
    //print(addedHobbies);
    notifyListeners();
  }
}
