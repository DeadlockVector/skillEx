import 'package:flutter/material.dart';
import 'package:skillex/widgets/smallText.dart';

import '../imp/dimensions.dart';
class ExpText extends StatefulWidget {
  final String text;
  const ExpText({Key? key, required this.text}) : super(key: key);

  @override
  State<ExpText> createState() => _ExpTextState();
}

class _ExpTextState extends State<ExpText> {
  late String firstHalf;
  late String secondHalf;

  bool hiddenText= true;

  double textHeight= 130;

  @override
  void initState(){
    super.initState();
    if(widget.text.length>textHeight){
      firstHalf=widget.text.substring(0,textHeight.toInt());
      secondHalf=widget.text.substring((textHeight.toInt()+1),widget.text.length);
    }
    else{
      firstHalf=widget.text;
      secondHalf="";
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty?Smalltext(text: firstHalf):Column(
        children: [
          Smalltext(height:1.8,size:Dimensions.font16,text: hiddenText?("$firstHalf..."):(firstHalf+secondHalf)),
          InkWell(
            onTap: (){
              setState(() {
                hiddenText=!hiddenText;
              });
            },
            child: Row(
              children: [
                Smalltext(text: "Show more", color: Colors.grey,),
                Icon(hiddenText?Icons.arrow_drop_down:Icons.arrow_drop_up,color: Colors.black,),

              ],
            ),
          )
        ],
      ),

    );
  }
}
