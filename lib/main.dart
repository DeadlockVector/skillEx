import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skillex/HOME!!/skillDisplay.dart';

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
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Skilldsip(),
         );
  }
}
