import 'package:flutter/material.dart';
import 'package:hub_flutter/colors.dart';
import 'package:hub_flutter/screens/add_business_description.dart';
import 'package:hub_flutter/screens/location.dart';
import 'package:hub_flutter/widgets/CustomContainer.dart';
import 'package:hub_flutter/widgets/custom_button.dart';
import 'package:hub_flutter/widgets/custom_padding.dart';
import 'package:hub_flutter/widgets/custom_sizedBox.dart';
import 'package:hub_flutter/widgets/custom_text.dart';
class Congrats extends StatefulWidget {
  const Congrats({super.key});

  @override
  State<Congrats> createState() => _CongratsState();
}

class _CongratsState extends State<Congrats> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: 
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              CustomContainer(
                  gradientColor: true,
                  height: 1.3,
                  width: double.infinity,
                  child: Column(
                    children: [
                      CustomSizedBox(height: 0.05, width: 0),
                     
                      CustomSizedBox(height: 0.02, width: 0),
                      CustomContainer(
                          height: 1,
                          width: double.infinity,
                          child: CustomPadding(
                            left: 0.03,
                            right: 0.03,
                            top: 0,
                            bottom: 0,
                            child: Column(
                              children: [
                                Image.asset('assets/finishedImage.png',height: 200,),
                               CustomSizedBox(height: 0.05, width: 0),
                                CustomText(
                                  text: 'CONGRATES!',
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                                CustomSizedBox(height: 0.02, width: 0),
                                CustomText(
                                  text: 'YOU COMPLETED THE PROCESS',
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                                CustomSizedBox(height: 0.02, width: 0),
                                CustomText(
                                  text: 'your Business Website URL:https://www.1clx.com/businessname',
                                  fontSize: 20,
                                ),
                                CustomSizedBox(height: 0.05, width: 0),
                              CustomButton(
                                bgColor: Colors.blueAccent,
                                buttonText: 'DASHBOARD', onPressed: (){}),
                                CustomSizedBox(height: 0.02, width: 0),
                                CustomButton(
                                buttonText: 'WEBSITE', onPressed: (){}),
                            
                                    CustomSizedBox(height: 0.1, width: 0),
                                  Row(
                                  children: [
                                    Image.asset(
                                      'assets/person.jpg',
                                      height: 50,
                                    ),
                                    CustomSizedBox(height: 0, width: 0.05),
                                    InkWell(child: Image.network("https://firebasestorage.googleapis.com/v0/b/oneclx.appspot.com/o/asset%2Flogo%2FLefi.png?alt=media&token=6ce0a918-d370-46ac-8569-13be12e85940"),onTap: (){
                                      Navigator.pop(context);
                                    },),
                                     CustomSizedBox(height: 0, width: 0.05),
                                    CustomText(
                                      text: 'SWIPE',
                                      color: OverAllBgColor,
                                    ),
                                    CustomSizedBox(height: 0, width: 0.05),
                                    InkWell(
                                      child: Image.network(
                                          "https://firebasestorage.googleapis.com/v0/b/oneclx.appspot.com/o/asset%2Flogo%2FRight.png?alt=media&token=6f429db7-33c2-4063-865b-f0f8417a4acc"),
                                      onTap: () {
                                        // Navigator.push(
                                        //     context,
                                        //     MaterialPageRoute(
                                        //       builder: (context) =>
                                        //           AddBusiness(),
                                        //     ));
                                      },
                                    )
                                  ],
                                )
                              ],
                            ),
                          )),
                    ],
                  ))
            ],
          ),
        )
        );
  }
}