import 'package:flutter/material.dart';

import '../imp/dimensions.dart';

class Smalltext extends StatelessWidget {
  Color? color;
  final String text;
  final double size;
  double height;
  Smalltext({
    Key? key,
    this.color = const Color(0xFF332d2b),
    this.size = 0,
    this.height = 1.5,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      style: TextStyle(
        color: color,
        fontFamily: 'Roboto',
        fontSize: size == 0 ? Dimensions.font20 : size,
        height: height,
      ),
    );
  }
}
