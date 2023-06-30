import 'package:flutter/material.dart';

class UserInfoValueModel with ChangeNotifier {
  var response = List.empty(growable: true); //  radiobutton respone stored
  List<bool> isResponsed = [false]; //  whether the question was responsed
  String userNickName = '';
  String height = '';
  String weight = '';
  bool isSubmitted = false; //  whether user agree to submit thier diagnosis
  bool isAgree = false; //  whether user agree to start application

  void userNickNameUpdate(value) {
    userNickName = value;
    notifyListeners();
  }

  void userHeightUpdate(value) {
    height = value;
    notifyListeners();
  }

  void userWeightUpdate(value) {
    weight = value;
    notifyListeners();
  }

  void responseAdd(value, indexes) {
    response.insert(indexes, value);
    isResponsed.insert(indexes, true);
    isResponsed.insert(indexes + 1, false);
  }

  void isAgreeUpdate(value) {
    isAgree = value;
    notifyListeners();
  }

  void isSubmittedUpdate() {
    isSubmitted = true;
    notifyListeners();
  }

  String returnResponse(indexes) {
    return response.elementAt(indexes).toString();
  }
}
