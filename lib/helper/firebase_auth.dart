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

      return true;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  // register
  Future registerUserWithEmailandPassword(
      String fullName, String email, String password) async {
    try {
      User user = (await firebaseAuth.createUserWithEmailAndPassword(
              email: email, password: password))
          .user!;

      await DatabaseService(uid: user.uid).savingUserData(fullName, email);
      return true;
    } on FirebaseAuthException catch (e) {
      return e.message;
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


// class FirebaseAuthHelper {
//   // function to add user details
//   static Future addUserDetails(String name, String email, String lifePhase,
//       int age, int phoneNumber) async {
//     await FirebaseFirestore.instance.collection('users').add({
//       'name': name,
//       'email': email,
//       'lifePhase': lifePhase,
//       'age': age,
//       'phoneNumber': phoneNumber,
//     });
//   }

//   static Future<User?> registerUsingEmailPassword(
//       {required String email,
//       required String password,
//       required String name,
//       required String lifePhase,
//       required int age,
//       required int phoneNumber}) async {
//     FirebaseAuth auth = FirebaseAuth.instance;
//     User? user;

//     // this just aunthenticates the user
//     // creating the user basically with an email and password
//     try {
//       UserCredential userCredential = await auth.createUserWithEmailAndPassword(
//         email: email,
//         password: password,
//       );

//       user = userCredential.user;
//       await user!.reload();
//       user = auth.currentUser;

//       // gotta add user details to database now
//       // after authentication
//       addUserDetails(name, email, lifePhase.toLowerCase(), age, phoneNumber);
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'weak-password') {
//         print('The password provided is too weak.');
//       } else if (e.code == 'email-already-in-use') {
//         print('The account already exists for that email.');
//       }
//     } catch (e) {
//       print(e);
//     }

//     return user;
//   }

//   static Future<User?> signInUsingEmailPassword({
//     required String email,
//     required String password,
//   }) async {
//     FirebaseAuth auth = FirebaseAuth.instance;
//     User? user;

//     try {
//       UserCredential userCredential = await auth.signInWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//       user = userCredential.user;
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'user-not-found') {
//         print('No user found for that email.');
//       } else if (e.code == 'wrong-password') {
//         print('Wrong password provided.');
//       }
//     }

//     return user;
//   }
// }


// Future registerUserWithEmailandPassword(
//       String fullName, String email, String password) async {
//     try {
//       User user = (await FirebaseAuth.createUserWithEmailAndPassword(
//               email: email, password: password))
//           .user!;

//       if (user != null) {
//         // call our database service to update the user data.
//         await DatabaseService(uid: user.uid).savingUserData(fullName, email);
//         return true;
//       }
//     } on FirebaseAuthException catch (e) {
//       return e.message;
//     }
//   }