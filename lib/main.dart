import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'HOME!!/homepage.dart';
import 'screens/login_screen.dart';

void main() {
  runApp( Skillex());
}
class Skillex extends StatelessWidget {
 Skillex({Key? key}) : super(key: key);
  bool isLoggedin=false;
  @override
  Widget build(BuildContext context) {
    
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: isLoggedin ?const Homepage(): const LoginScreen(),
    );
  }
}
