import 'package:flutter/material.dart';

import '../imp/dimensions.dart';

class Largetext extends StatelessWidget {
  Color? color;
  final String text;
  final double size;
  final TextOverflow overflow;

  Largetext({
    Key? key,
    this.color = const Color(0xFF332d2b),
    this.overflow = TextOverflow.ellipsis,
    this.size = 30.0,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overflow,
      style: TextStyle(
        color: color,
        fontWeight: FontWeight.w400,
        fontFamily: 'Roboto',
        fontSize: Dimensions.font20,
      ),
    );
  }
}
