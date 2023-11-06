import 'package:flutter/material.dart';

class CustomPadding extends StatelessWidget {
 double left;
 double right;
  double top;
   double bottom;
   Widget child;
   CustomPadding({super.key,required this.left,
  required this.right,required this.top,required this.bottom,required this.child
  });

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*left,right: MediaQuery.of(context).size.width*right,top: MediaQuery.of(context).size.width*top,bottom: MediaQuery.of(context).size.width*bottom,),child: child,);
  }
}