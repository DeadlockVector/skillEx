import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skillex/HOME!!/highestRated.dart';
import 'package:skillex/HOME!!/skillDisplay.dart';
import 'HOME!!/homepage.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(const Skillex());
}
class Skillex extends StatelessWidget {
  const Skillex({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    );
  }
}
