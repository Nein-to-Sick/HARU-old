import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';


class Mission {
  Future<List<List<String>>> fetchMission() async {
    DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
    await FirebaseFirestore.instance
        .collection('mission')
        .doc('level1')
        .get();

    if (documentSnapshot.exists) {
      Map<String, dynamic>? data = documentSnapshot.data();
      if (data != null) {
        List<String> missionFields = data.keys
            .where((key) => key.startsWith('mission'))
            .toList();


        List<int> randomNumbers = [1, 2, 3];

        if(DateTime.now().add(const Duration(microseconds: 10)).minute != DateTime.now().minute){
          while (randomNumbers.length < 3) {
            int randomNumber = Random().nextInt(4);
            if (!randomNumbers.contains(randomNumber)) {
              randomNumbers.add(randomNumber);
            }
          }
          print(randomNumbers);
        }
        //missionFields.shuffle();

        List<List<String>> mission = [];
        for (int i = 0; i < 3; i++) {
          //랜덤
          String missionField = missionFields[randomNumbers[i]];
          mission.add(List<String>.from(data[missionField]));
        }
        return mission;
      }
    }

    return [];
  }
}