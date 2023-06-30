import 'package:cap_stone_project/pages/self_diagnosis/provider/user_info_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

void userInfoFirebaseUpdate(BuildContext context) {
  String currentUserId = FirebaseAuth.instance.currentUser!.uid;
  FirebaseFirestore.instance.collection('users').doc(currentUserId).update({
    'nickname':
        Provider.of<UserInfoValueModel>(context, listen: false).userNickName,
    'height': Provider.of<UserInfoValueModel>(context, listen: false).height,
    'weight': Provider.of<UserInfoValueModel>(context, listen: false).weight,
    'SelfDiagnosisDone':
        Provider.of<UserInfoValueModel>(context, listen: false).isAgree,
  });

  return;
}
