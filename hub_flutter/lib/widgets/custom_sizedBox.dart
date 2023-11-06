import 'package:flutter/material.dart';

class CustomSizedBox extends StatelessWidget {
 double height;
 double width;
   CustomSizedBox({super.key,required this.height,required this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: MediaQuery.of(context).size.height*height,width: MediaQuery.of(context).size.width*width,);
  }
}