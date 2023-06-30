import 'package:cap_stone_project/pages/self_diagnosis/provider/user_info_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

Future<void> userInfoFirebaseUpdate(BuildContext context) async {
  final userCollection = FirebaseFirestore.instance.collection("users");

  String? userId = FirebaseAuth.instance.currentUser?.uid;

  final docRef = userCollection.doc(userId);

  await docRef.update({
    "nickname":
        Provider.of<UserInfoValueModel>(context, listen: false).userNickName,
    "hight": Provider.of<UserInfoValueModel>(context, listen: false).height,
    "weight": Provider.of<UserInfoValueModel>(context, listen: false).weight,
    "SelfDiagnosisIsDone":
        Provider.of<UserInfoValueModel>(context, listen: false).isSubmitted,
  });

  return;
}
