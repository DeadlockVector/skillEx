import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:skillex/imp/dimensions.dart';
import 'package:skillex/imp/matter.dart';
import 'package:skillex/widgets/iconsImages.dart';
import 'package:skillex/widgets/largeText.dart';
import 'package:skillex/widgets/smallText.dart';

class Skilldsip extends StatefulWidget {
  const Skilldsip({Key? key}) : super(key: key);

  @override
  State<Skilldsip> createState() => _SkilldsipState();
}

class _SkilldsipState extends State<Skilldsip> {
  var _currPageValue = 0.0;
  final double _scaleFactor = 0.8;
  final double _height = Dimensions.pageViewContainer;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(viewportFraction: 0.8);
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Skill display slider.
        SizedBox(
          height: 400,
          child: PageView.builder(
            controller: pageController,
            itemCount: 6,
            itemBuilder: (context, position) {
              return _itemDisplay(position);
            },
          ),
        ),
        DotsIndicator(
          dotsCount: 6,
          position: _currPageValue,
          decorator: const DotsDecorator(
            color: Colors.grey, // Inactive color
            activeColor: Colors.black,
          ),
        ),
        SizedBox(height: Dimensions.height10),
        Container(
          margin: EdgeInsets.only(left: Dimensions.width40),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Largetext(text: "Popular skillians: "),

              SizedBox(width: Dimensions.width10),
              Container(
                margin: const EdgeInsets.only(bottom: 3),
                child: Largetext(text: ".", color: Colors.black26),
              ),
              SizedBox(width: Dimensions.width10),
              Container(
                margin: const EdgeInsets.only(bottom: 2),
                child: Largetext(text: ""),
              ),
            ],
          ),
        ),
        // List of people ready to exchange skills.
        SizedBox(
          height: 700,
          child:ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            //sshrinkWrap: true,
            itemCount: 15,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(right: Dimensions.width20, left: Dimensions.width20,bottom:Dimensions.height10),
                child: Row(
                  children: [
                    Container(
                      // image size if required!
                      width:Dimensions.listViewImgSize,
                      height :120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimensions.radius30),
                        color: Colors.black,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height:100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(Dimensions.radius30),
                            bottomRight: Radius.circular(Dimensions.radius30),

                          ),
                          color: Colors.grey,
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: Dimensions.width10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Largetext(text: "Name: ",),
                              SizedBox(height: Dimensions.height10),
                              const Padding(padding: EdgeInsets.only(left: 8.0)),
                              Largetext(text: "Profession: "),
                              const Padding(padding: EdgeInsets.only(top:12.0)),
                              // icons.
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Iconandtext(icon: Icons.message_rounded, iconColor: Colors.black),
                                  Iconandtext(icon: Icons.location_on_rounded, iconColor: Colors.black),
                                  Iconandtext(icon: Icons.add_business_rounded, iconColor: Colors.black),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        )
      ],
    );
  }
  Widget _itemDisplay(int index) {
    Matrix4 matrix = Matrix4.identity();
    if (index == _currPageValue.floor()) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() + 1) {
      var currScale = _scaleFactor + (_currPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() - 1) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 1);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: Dimensions.pageViewContainer,
            margin: EdgeInsets.symmetric(horizontal: Dimensions.width10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius40),
              color: Colors.black,
            ),
            child: const Center(
              child: Text(
                'USER\'S SKILLS AND QUALIFICATIONS!!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimensions.pageViewTextContainer,
              margin: EdgeInsets.fromLTRB(
                Dimensions.width40,
                0,
                Dimensions.width40,
                Dimensions.width40,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius30),
                color: Colors.grey,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 5.0,
                    offset: Offset(0, 7),
                  ),
                ],
              ),
              child: Container(
                padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
                child: AppColumn(text: "Name of the user.",),
              ),
            ),
          ),
        ],
      ),
    );
  }
}