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

    final userCollection = FirebaseFirestore.instance.collection("users");

    String? userId = FirebaseAuth.instance.currentUser?.uid;

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
    });

    DateTime selectedDate =
        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
    String todayDate = selectedDate.toString().substring(0, 10);
    await docRef.collection(todayDate);

    //finally, lets sign in
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
