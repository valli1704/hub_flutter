import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hub_flutter/colors.dart';
import 'package:hub_flutter/config/app_url.dart';
import 'package:hub_flutter/constant_file.dart';
import 'package:hub_flutter/screens/add_business_description.dart';
import 'package:hub_flutter/screens/congrats.dart';
import 'package:hub_flutter/screens/location.dart';
import 'package:hub_flutter/utilities.dart';
import 'package:hub_flutter/widgets/CustomContainer.dart';
import 'package:hub_flutter/widgets/custom_button.dart';
import 'package:hub_flutter/widgets/custom_padding.dart';
import 'package:hub_flutter/widgets/custom_sizedBox.dart';
import 'package:hub_flutter/widgets/custom_text.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
class Publish extends StatefulWidget {
  const Publish({super.key});

  @override
  State<Publish> createState() => _PublishState();
}

class _PublishState extends State<Publish> {
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
                      Image.network(
                        'https://firebasestorage.googleapis.com/v0/b/oneclx.appspot.com/o/asset%2Ficon%2Fpub.png?alt=media&token=36a32f5b-6b53-428c-97f9-3210dc5cc22c',
                        height: 100,
                      ),
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
                                CustomText(
                                  text: 'PUBLISH',
                                  color: OverAllBgColor,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                                CustomSizedBox(height: 0.02, width: 0),
                                CustomText(
                                  text: '3 of 6 completed',
                                  color: OverAllBgColor,
                                ),
                                Container(
                                  width: double.infinity,
                                  color: OverAllBgColor,
                                  height: 0.03,
                                ),
                                CustomSizedBox(height: 0.1, width: 0),
                                CustomText(
                                  text: 'PUBLISH',
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                                CustomSizedBox(height: 0.1, width: 0),
                                CustomText(
                                  text: 'EASILY IN MINUTES',
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                                CustomSizedBox(height: 0.02, width: 0),
                                CustomText(
                                  text: 'Create a website for your business',
                                  fontSize: 20,
                                ),
                                CustomSizedBox(height: 0.02, width: 0),
                              CustomButton(
                                
                                buttonText: 'PUBLISH', onPressed: (){
                                  businessInformation();
                                }),
                            
                                    CustomSizedBox(height: 0.13, width: 0),
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
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  Congrats(),
                                            ));
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
  businessInformation() async {
      _showLoaderDialog();
    var url = "${AppUrl.baseUrl}${AppUrl.addBusiness}";
    var body = {
      "userId": Appconstant.userId.toString(),
"businessName": Appconstant.businessName.toString(),
"businessTypeId": Appconstant.businessTypeId.toString(),
"countryId": Appconstant.countryId.toString(),
"stateId":2.toString(),
"city": Appconstant.city.toString(),
"pincode": Appconstant.pincode.toString(),
"phoneNumber":Appconstant.phoneNumber.toString(),
"latitude": Appconstant.latitude.toString(),
"longitude": Appconstant.longitude.toString(),
"emailId": Appconstant.emailId.toString(),
"address": Appconstant.address.toString(),
"description": Appconstant.description.toString(),
"websiteUrl": Appconstant.websiteUrl.toString(),
"logoImg": Appconstant.logoImg.toString(),
"headerImg":Appconstant.headerImg.toString(),
"businessImg": Appconstant.businessImg.toString(),
    };
    var uri = Uri.parse(url);
    var response = await http.post(uri, body: body);
    
    if (response.statusCode == 200) {
      
      var data = response.body;
      var json = jsonDecode(data);
      Utilities.showToastSuccess('${json['message']}');
      Navigator.push(context, MaterialPageRoute(builder: (context) => Congrats(),));
    } else {
    
      var data = response.body;
      var json = jsonDecode(data);

     
     // Utilities.showToastError('${json["message"]}');
     print("dataaa:$data");
      Navigator.pop(context);
    }
  }

  _showLoaderDialog() {
    AlertDialog alert = AlertDialog(
      backgroundColor: Colors.white,
      content: Row(children: [
        CircularProgressIndicator(
          backgroundColor: Colors.black,
        ),
        Container(
            margin: EdgeInsets.only(left: 7), child: Text("Please Wait...")),
      ]),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
  }
