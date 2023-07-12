import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../widgets/iconsImages.dart';
import '../widgets/smallText.dart';
import 'dimensions.dart';
class AppColumn extends StatelessWidget {
  final String text;
  const AppColumn({Key? key,required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Smalltext(text: text, size: Dimensions.font30,),
          SizedBox(height: Dimensions.height10),
          Row(
            children: [
              Wrap(
                children: List.generate(5,
                      (index) => const Icon(
                      Icons.star,
                      color: Colors.black,
                      size: 15,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Smalltext(text: "5"),
              const SizedBox(width: 10),
              Smalltext(text: "(rating)"),
            ],
          ),
          SizedBox(height: Dimensions.height20),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Iconandtext(icon: Icons.message_rounded, iconColor: Colors.black),
              Iconandtext(icon: Icons.location_on_rounded, iconColor: Colors.black),
              Iconandtext(icon: Icons.add_business_rounded, iconColor: Colors.black),
            ],
          ),
        ],
      );
  }
}
