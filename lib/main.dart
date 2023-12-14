import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skillex/helper/helper_functions.dart';
import 'HOME!!/homepage.dart';
import 'screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Skillex());
}


class Skillex extends StatelessWidget {
  Skillex({Key? key}) : super(key: key);
  bool isLoggedin = true;
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: HelperFunctions.isLoggedIn(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          bool isLoggedIn = snapshot.data ?? true;
          String userName = HelperFunctions.userNameKey;
          return isLoggedIn? Homepage(userName: userName,) : LoginPage();
        }
        else {
          return const CircularProgressIndicator();
        }
      }
    );
  }
}

