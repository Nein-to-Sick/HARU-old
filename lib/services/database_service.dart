import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DatabaseService {
  String? userId = FirebaseAuth.instance.currentUser?.uid;

  void missionEmotion(int faceIndex, int missionIndex, String text1,
      String text2, String text3) async {
    print(userId);
    DocumentReference dr = FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection("mission")
        .doc("mission${missionIndex+1}");

    dr.update({
      'faceIndex': faceIndex,
      'text1': text1,
      'text2': text2,
      'text3': text3
    });
  }
}
