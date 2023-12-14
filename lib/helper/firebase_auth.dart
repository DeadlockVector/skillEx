import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:skillex/helper/database_services.dart';
import 'package:skillex/helper/helper_functions.dart';

class AuthService {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  // login
  Future loginWithUserNameandPassword(String email, String password) async {
    try {
      User user = (await firebaseAuth.signInWithEmailAndPassword(
              email: email, password: password))
          .user!;

      if (user !=  null) {
        return true;
      }
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  // register
  Future registerUserWithEmailandPassword(
      String fullName, String email, String password, String phoneNumber, String studentOrWorking) async {
    try {
      User user = (await firebaseAuth.createUserWithEmailAndPassword(
              email: email, password: password))
          .user!;

      if (user !=  null) {
        // call our database service to update the user data.
        // user id being initialised here in line 28
        // figure out a way to pass it into the storing secondary info function in database services
        await DatabaseService(uid: user.uid).savingUserPrimaryData(fullName, email, phoneNumber, studentOrWorking);
        return true;
      }
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  // secondary data after registering
  Future addUserSecondaryInfoStudent(
      String university, String location, String branch, String semester) async {
    try {
      User? user = firebaseAuth.currentUser;
      if (user != null) {
        // Get the user's UID
        String uid = user.uid;

        // updating secondary info
        // calling function from DatabaseService
        await DatabaseService(uid: uid).savingUserSecondaryDataStudent(
          university,
          location,
          branch,
          semester
        );

        return true;
      } else {
        return "User not logged in";
      }
    } catch (e) {
      return e.toString();
    }
  }

  Future addUserSecondaryInfoWorking(
    String organisation, String city, String designation, String experience) async {
      try {
        User? user = firebaseAuth.currentUser;
        if (user != null) {
          String uid = user.uid;

          await DatabaseService(uid: uid).savingUserSecondaryDataWorking(
            organisation,
            city,
            designation,
            experience
          );

          return true;
        } else {
          return "User not logged in";
        }

      } catch (e) {
        return e.toString();
      }
    }
  

  // signout
  Future signOut() async {
    try {
      await HelperFunctions.saveUserLoggedInStatus(false);
      await HelperFunctions.saveUserEmailSF("");
      await HelperFunctions.saveUserNameSF("");
      await firebaseAuth.signOut();
    } catch (e) {
      return null;
    }
  }
}
