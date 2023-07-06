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
      'text3': text3,
      'complete': true
    });
  }

  void missionRegister(List<List<String>> mission) {
    int missionCount = mission.length;
    for (int i = 0; i < missionCount; i++) {
      DocumentReference dr = FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection(todayDate)
          .doc("mission${i + 1}");
      dr.update({
        'mission': mission[i],
      });
    }
  }

  Future<double> missionClear() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection(todayDate)
        .get();

    double completedMissions = 0;
    for (final DocumentSnapshot document in querySnapshot.docs) {
      try {
        bool? isComplete = document['complete'];
        if (isComplete == true) {
          completedMissions++;
        }
      } catch (e) {
        continue;
      }
    }
    return completedMissions;
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
      try {
        final int faceIndex = document['faceIndex'];
        total += faceIndex;
      } catch (e) {
        continue;
      }
    }
    total = (total / 3).round();
    return total;
  }


}
