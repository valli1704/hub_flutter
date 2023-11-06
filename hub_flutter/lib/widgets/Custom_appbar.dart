import 'package:flutter/material.dart';
import 'package:hub_flutter/widgets/custom_text.dart';

class CustomAppBar extends StatelessWidget {
  String text;
   CustomAppBar({super.key,required this.text});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title:  CustomText(text: text,fontSize: 20,fontWeight: FontWeight.bold,),
      leading: InkWell(child: Icon(Icons.arrow_back_ios,color: Colors.black,),onTap: (){
        Navigator.pop(context);
      },),
    );
  }
}