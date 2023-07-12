import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Iconandtext extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  const Iconandtext({Key? key, required this.icon, required this.iconColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: iconColor,
        ),
        const SizedBox(
          width: 5,
        ),
      ],
    );
  }
}
