import 'package:firebase_auth/firebase_auth.dart';

class DatabaseService {
  String? userId = FirebaseAuth.instance.currentUser?.uid;

  void missionEmotion() {
    print(userId);
  }
}