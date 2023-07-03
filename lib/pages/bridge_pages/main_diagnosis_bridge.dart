import 'package:cap_stone_project/pages/bridge_pages/while_loading_page.dart';
import 'package:cap_stone_project/pages/mainPage/mainPage.dart';
import 'package:cap_stone_project/pages/self_diagnosis/self_diagnosis_start_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class BridgPage extends StatelessWidget {
  const BridgPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getDataFromFirebase(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData == false) {
          return const MyLoadingPage();
        } else if (snapshot.hasError == true) {
          return const MyLoadingPage();
        } else {
          return (snapshot.data)
              ? const MainPage()
              : const SelfDiagnosisStartPage();
        }
      },
    );
  }
}

//  구글의 userId 다른가?
Future<bool> _getDataFromFirebase() async {
  bool selfDiagnosisIsDone = false;
  final userCollection = FirebaseFirestore.instance.collection("users");
  String? userId = FirebaseAuth.instance.currentUser?.uid;
  await userCollection.doc(userId).get().then(
        (value) => {
          selfDiagnosisIsDone = value['SelfDiagnosisIsDone'],
        },
      );

  return selfDiagnosisIsDone;
}
