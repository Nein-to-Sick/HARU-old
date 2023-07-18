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
    final GoogleSignInAuthentication gAuth = await gUser.authentication;

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
    DocumentSnapshot snapshot = await docRef.get();

    // FirebaseFirestore.instance
    //     .collection("users")
    //     .doc(FirebaseAuth.instance.currentUser?.uid)
    //     .get();

    if (snapshot.exists) {
      print("true");
    } else {
      await docRef.set({
        "nickname": "",
        "hight": 0.0,
        "weight": 0.0,
        "gender": 1,
        "age": 0,
        "birthday": null,
        "SelfDiagnosisIsDone": false,
        "email": userEmail,
        "created_at": FieldValue.serverTimestamp(),
        "hexagon": [0, 0, 0, 0, 0, 0],
        "progressDeck": [],
        "imageURL": FirebaseAuth.instance.currentUser?.photoURL,
      });
    }

    DateTime selectedDate =
        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
    String todayDate = selectedDate.toString().substring(0, 10);

    final dateDocRef = docRef.collection("date").doc(todayDate);

    DocumentSnapshot snapshotDate = await dateDocRef.get();

    if (snapshot.exists) {
      print("true");
    } else {
      await dateDocRef.set({
        "mission": [],
        "completed": [false, false, false],
      });
    }

    //finally, lets sign in
    return userCredential;
  }
}
