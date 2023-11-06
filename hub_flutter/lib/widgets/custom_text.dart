import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  String text;
  double fontSize;
  Color color;
  FontWeight fontWeight;
   CustomText({super.key,
  required this.text,
  this.color=Colors.black,
  this.fontSize=15,
  this.fontWeight= FontWeight.normal
  });

  @override
  Widget build(BuildContext context) {
    return Text(
text,style: TextStyle(color: color,fontSize: fontSize,fontWeight: fontWeight),
    );
  }
}