import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthHelper {
  // function to add user details
  static Future addUserDetails(String name, String email, String lifePhase,
      int age, int phoneNumber) async {
    await FirebaseFirestore.instance.collection('users').add({
      'name': name,
      'email': email,
      'lifePhase': lifePhase,
      'age': age,
      'phoneNumber': phoneNumber,
    });
  }

  static Future<User?> registerUsingEmailPassword(
      {required String email,
      required String password,
      required String name,
      required String lifePhase,
      required int age,
      required int phoneNumber}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    // this just aunthenticates the user
    // creating the user basically with an email and password
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      user = userCredential.user;
      await user!.reload();
      user = auth.currentUser;

      // gotta add user details to database now
      // after authentication
      addUserDetails(name, email, lifePhase.toLowerCase(), age, phoneNumber);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }

    return user;
  }

  static Future<User?> signInUsingEmailPassword({
    required String email,
    required String password,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided.');
      }
    }

    return user;
  }
}
