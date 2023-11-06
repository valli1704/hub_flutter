import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hub_flutter/widgets/custom_text.dart';

class CustomTextFormField extends StatelessWidget {
  TextEditingController controller;
  //  String labelText;
  String hintText;
  Widget icons;
  bool contentPadding;
   var inputFormatters;
   final TextInputType keyboardType;
  CustomTextFormField(
      {super.key,
      required this.controller,
      this.keyboardType = TextInputType.text,
      
      //required this.labelText,
      required this.hintText,
      required this.icons,
   required this.inputFormatters,
      this.contentPadding = false});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      controller: controller,
      autofocus: true,
        inputFormatters: [inputFormatters],
      decoration: InputDecoration(
          isDense: true,
          contentPadding: contentPadding == true
              ? EdgeInsets.only(top: 50, bottom: 25, left: 10.0)
              : EdgeInsets.only(top: 0, bottom: 0, left: 10),
          //  label: CustomText(text: labelText,color: Colors.grey,),
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey),
          suffixIcon: icons,
          fillColor: Colors.grey[100],
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );
  }
}
