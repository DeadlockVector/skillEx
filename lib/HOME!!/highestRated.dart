import 'package:flutter/material.dart';
import 'package:skillex/imp/matter.dart';
import 'package:skillex/widgets/expandable_text.dart';
import '../imp/dimensions.dart';
import '../widgets/smallText.dart';

class HighestRatedsk extends StatelessWidget {
  const HighestRatedsk({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //display cover.
          Positioned(
              left:0,
              right: 0,
              child:Container(
                width: double.maxFinite,
                height: Dimensions.coverdisp,

                decoration: BoxDecoration(
                  /*image: DecorationImage(
                     fit:BoxFit.cover,
                      image:AssetImage(
                        "assets-firebase."
                      )
                  )*/
                  color: Colors.black,
                ),

          )),
          //icon widgets.
          Positioned(
            top:50,
            height: Dimensions.height20,
            left: Dimensions.width20,
            right: Dimensions.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.arrow_back_ios_new_sharp,color:Colors.white,size: 30,),
                Icon(Icons.person_add, color: Colors.white,size: 30,),

              ],
            )),
          //descprition of the user.
          Positioned(
              left: 0,
              right: 0,
              top: Dimensions.coverdisp,
              bottom: 0,
              child:
              Container(
                padding: EdgeInsets.only(left:Dimensions.width20, right: Dimensions.width20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius30),
                    color: Colors.white,
                  ),
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppColumn(text: "Name of the user.",),
                    SizedBox(height: Dimensions.height20,),
                    Smalltext(text: "About me: "),
                    Expanded(child: SingleChildScrollView(child: ExpText(text: "Motivated professional seeking a challenging position to utilize skills and experience for organizational success.Bachelor of Science in Business Administration | XYZ University | Anytown, USA | Graduated May 20XXMarketing principles and strategies Social media marketing"),)),

                  ],
                ),
              )),
        ],
      ),
      bottomNavigationBar: Container(
        height: 120,
        padding: EdgeInsets.only(top: Dimensions.height20,bottom: Dimensions.height20, left: Dimensions.width20, right: Dimensions.width20),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.only(
                  topRight:Radius.circular(Dimensions.radius40),
                  topLeft: Radius.circular(Dimensions.radius40)
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(top: Dimensions.height15, bottom: Dimensions.height15,left: Dimensions.width20,right: Dimensions.width20),
              child:Smalltext(text: "Status",),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius40/2),
                color: Colors.white,
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: Dimensions.height15, bottom: Dimensions.height15,left: Dimensions.width20,right: Dimensions.width20),
              child: Smalltext(text: "Bookmark",),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius40/2),
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}

