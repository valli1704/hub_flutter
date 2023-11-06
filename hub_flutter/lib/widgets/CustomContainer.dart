import 'package:flutter/material.dart';
import 'package:hub_flutter/colors.dart';

class CustomContainer extends StatelessWidget {
  bool border;
  bool gradientColor;
  double borderRadius;
  double height;
  double width;
  Widget child;
  Color colors;
   CustomContainer({super.key,required this.height,required this.width,required this.child, this.gradientColor=false,this.colors=Colors.white,this.borderRadius=0,this.border=false});

  @override
  Widget build(BuildContext context) {
    return Container(
    height: MediaQuery.of(context).size.height*height,width: MediaQuery.of(context).size.width*width,
      child: child,
      decoration: BoxDecoration(
        border: border==true?Border.all(color:OverAllBgColor):Border.all(color: Colors.white),
        borderRadius: BorderRadius.only(topLeft: Radius.circular(borderRadius),topRight:Radius.circular(borderRadius), ),
        color: colors,
        gradient: gradientColor==true?LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [OverAllBgColor,Colors.white]):LinearGradient(colors: [Colors.white,Colors.white])
    ));
  }
}