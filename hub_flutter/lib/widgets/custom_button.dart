import 'package:flutter/material.dart';
import 'package:hub_flutter/colors.dart';
import 'package:hub_flutter/widgets/custom_text.dart';

class CustomButton extends StatelessWidget {
  String buttonText;
  var onPressed;
  double width;
   Color bgColor;
   CustomButton({super.key,required this.buttonText,required this.onPressed,this.width=250,this.bgColor=const Color.fromRGBO(25, 118, 210, 1)});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
            style: ButtonStyle(
              shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
              backgroundColor: MaterialStatePropertyAll(bgColor),
              minimumSize: MaterialStatePropertyAll(Size(width, 50))),
            onPressed: onPressed, child: CustomText(text:buttonText,color: Colors.white,fontWeight: FontWeight.bold));
  }
}