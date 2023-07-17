import 'package:cap_stone_project/pages/self_diagnosis/provider/hobbies_model.dart';
import 'package:cap_stone_project/pages/self_diagnosis/provider/user_info_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

Future<void> userInfoFirebaseUpdate(BuildContext context) async {
  DateTime now = DateTime.now();
  DateTime? birthday =
      Provider.of<UserInfoValueModel>(context, listen: false).birthday;
  int age = now.year - birthday!.year;

  if (now.month > birthday.month ||
      (now.month == birthday.month && now.day >= birthday.day)) {
    age++;
  }

  final userCollection = FirebaseFirestore.instance.collection("users");

  String? userId = FirebaseAuth.instance.currentUser?.uid;

  final docRef = userCollection.doc(userId);

  await docRef.update(
    {
      "nickname":
          Provider.of<UserInfoValueModel>(context, listen: false).userNickName,
      "hight": Provider.of<UserInfoValueModel>(context, listen: false).height,
      "weight": Provider.of<UserInfoValueModel>(context, listen: false).weight,
      "SelfDiagnosisIsDone":
          Provider.of<UserInfoValueModel>(context, listen: false).isSubmitted,
      "preferredHobbies":
          Provider.of<HobbiesModel>(context, listen: false).addedHobbies,
      "gender": Provider.of<UserInfoValueModel>(context, listen: false).gender,
      "birthday":
          Provider.of<UserInfoValueModel>(context, listen: false).birthday,
      "age": age,
    },
  );
}

Future<void> userDiagnosisResultFirebaseUpdate(UserInfoValueModel value) async {
  final userCollection = FirebaseFirestore.instance.collection("users");

  String? userId = FirebaseAuth.instance.currentUser?.uid;

  final docRef = userCollection.doc(userId);

  await docRef.update(
    {
      "SelfDiagnosisResult": value.userStatus,
    },
  );
}
