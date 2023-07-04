import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  //Google Sign In
  signInWithGoogle() async {
    //begin interactive sign in process
    GoogleSignIn _googleSignIn = GoogleSignIn();
    GoogleSignInAccount? gUser = await _googleSignIn.signIn();

    if (gUser == null) {
      // Sign in flow canceled.
      return null;
    }

    //obtain auth details from request
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;

    //create a new credential for user
    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );

    final userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);

    final userCollection = FirebaseFirestore.instance.collection("users");

    String? userId = FirebaseAuth.instance.currentUser?.uid;
    String? userEmail = FirebaseAuth.instance.currentUser?.email;

    final docRef = userCollection.doc(userId);

    await docRef.set({
      "nickname": "",
      "hight": 0.0,
      "weight": 0.0,
      "gender": 1,
      "activity level": 1,
      "age": 0,
      "SelfDiagnosisIsDone": false,
      "SelfDiagnosisResult": 0,
      "email": userEmail,
    });

    DateTime selectedDate =
        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
    String todayDate = selectedDate.toString().substring(0, 10);

    final missionCollection = FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection(todayDate);

    final mission1 = missionCollection.doc("mission1");
    await mission1.set({
      "faceIndex": 1,
    });

    final mission2 = missionCollection.doc("mission2");
    await mission2.set({
      "faceIndex": 2,
    });

    final mission3 = missionCollection.doc("mission3");
    await mission3.set({
      "faceIndex": 3,
    });

    //finally, lets sign in
    return userCredential;
  }
}
