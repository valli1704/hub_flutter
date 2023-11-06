import 'package:flutter/material.dart';
import 'package:hub_flutter/screens/sign_in.dart';
import 'package:hub_flutter/widgets/CustomContainer.dart';
import 'package:hub_flutter/widgets/custom_button.dart';
import 'package:hub_flutter/widgets/custom_padding.dart';
import 'package:hub_flutter/widgets/custom_sizedBox.dart';
import 'package:hub_flutter/widgets/custom_text.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomContainer(
          gradientColor: true,
            height: 1,
            width: double.infinity,
            child: Column(
              children: [
                CustomSizedBox(height: 0.05, width: 0),
                CustomPadding(
                  left: 0.02,right: 0.04,top: 0.05,bottom: 0.1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                     CustomText(text: '1CLX',fontSize: 40,fontWeight: FontWeight.bold,color:Colors.white)
                  ],),
                ),
                CustomText(text: 'CREATE',fontSize: 40,fontWeight: FontWeight.bold,color: Colors.white,),
                CustomText(text: 'YOUR BUSINESS',fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white,),
                CustomText(text: 'WEBSITE IN',fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white,),CustomText(text: '3 MINUTES',fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white,),
                
                CustomSizedBox(height: 0.05, width: 0),
                
                Image.asset('assets/splash_image.jpg',height: 250,width: double.infinity,),
                CustomSizedBox(height: 0.05, width: 0),
                CustomButton(buttonText: 'Get Started Now', onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SignInScreen(),));
                })
              ],
            )));
  }
}
