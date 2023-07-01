import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

DateTime selectedDate = DateTime(DateTime
    .now()
    .year, DateTime
    .now()
    .month, DateTime
    .now()
    .day);

class DatabaseService {
  String? userId = FirebaseAuth.instance.currentUser?.uid;
  String todayDate = selectedDate.toString().substring(0, 10);

  void missionEmotion(int faceIndex, int missionIndex, String text1,
      String text2, String text3) async {
    DocumentReference dr = FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection(todayDate)
        .doc("mission${missionIndex + 1}");

    dr.update({
      'faceIndex': faceIndex,
      'text1': text1,
      'text2': text2,
      'text3': text3
    });
  }

  Future<bool> checkDate(DateTime currentTime) async {
    String date = currentTime.toString().substring(0, 10);
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection(date).get();
    if (querySnapshot.docs.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  Future<int> averageFace(DateTime currentTime) async {
    String date = currentTime.toString().substring(0, 10);
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection(date).get();

    int total = 0;
    for (final DocumentSnapshot document in querySnapshot.docs) {
      final int faceIndex = document['faceIndex'];
      // 필드 값을 이용한 작업 수행
      total += faceIndex;
    }
    total = (total / 3).round();
    return total;

  }
}
