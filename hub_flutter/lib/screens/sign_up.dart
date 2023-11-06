import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hub_flutter/colors.dart';
import 'package:hub_flutter/config/app_url.dart';
import 'package:hub_flutter/screens/sign_in.dart';
import 'package:hub_flutter/utilities.dart';
import 'package:hub_flutter/widgets/CustomContainer.dart';
import 'package:hub_flutter/widgets/custom_button.dart';
import 'package:hub_flutter/widgets/custom_padding.dart';
import 'package:hub_flutter/widgets/custom_sizedBox.dart';
import 'package:hub_flutter/widgets/custom_text.dart';
import 'package:hub_flutter/widgets/custom_text_form_field.dart';
import 'package:http/http.dart' as http;

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: OverAllBgColor,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              CustomSizedBox(height: 0.02, width: 0),
              Image.asset(
                'assets/logIn.jpg',
                height: 200,
                width: 200,
              ),
              CustomSizedBox(height: 0.01, width: 0),
              CustomPadding(
                left: 0.1,
                right: 0.04,
                top: 0.02,
                bottom: 0.0,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    //  crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CustomText(
                            text: 'Sign Up',
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      ),
                      CustomSizedBox(height: 0.03, width: 0),
                      CustomTextFormField(
                          controller: userName,
                          hintText: "Please enter UserName",
                          keyboardType: TextInputType.text,
                          inputFormatters: FilteringTextInputFormatter(
                            allow:true,
                            RegExp("[a-zA-Z1234567890]"),),
                          icons: Icon(Icons.person)),
                      CustomSizedBox(height: 0.03, width: 0),
                      CustomTextFormField(
                          controller: email,
                          hintText: "Please enter emailId",
                           keyboardType: TextInputType.emailAddress,
                          inputFormatters: FilteringTextInputFormatter(
                            allow:true,
                             RegExp("[a-zA-Z0123456789-_-.]"),),
                          icons: Icon(Icons.email)),
                      CustomSizedBox(height: 0.02, width: 0),
                      CustomTextFormField(
                          controller: password,
                          hintText: "Please enter password",
                             keyboardType: TextInputType.text,
                          inputFormatters: FilteringTextInputFormatter(
                            allow:true,
                             RegExp("[a-zA-Z0123456789-_-.]"),),
                          icons: Icon(Icons.password)),
                      CustomSizedBox(height: 0.02, width: 0),
                      //      Container(
                      // height: 0.3,width: 0.3,child: Text(''),
                      // decoration: BoxDecoration(border: Border.all(color: OverAllBgColor)),),
                      CustomSizedBox(height: 0.02, width: 0),
                      CustomButton(
                          bgColor: const Color.fromRGBO(100, 181, 246, 1),
                          buttonText: 'CREATE ACCOUNT',
                          onPressed: () {
                            if (userName.text.trim() == null ||
                                userName.text.trim() == '') {
                              Utilities.showToastError('Please enter userName');
                            } else if (email.text.trim() == null ||
                                email.text.trim() == '') {
                              Utilities.showToastError('Please enter email');
                            } else if (password.text.trim() == null ||
                                password.text.trim() == '') {
                              Utilities.showToastError('Please enter password');
                            } else if (userName.text.length < 3 ||
                                userName.text.trim() == '') {
                              Utilities.showToastError(
                                  'UserName atleast 3 character');
                            } else if (!email.text.isValidEmail()) {
                              Utilities.showToastError(
                                "Enter valid email address",
                              );
                            } else if (password.text.length < 3 ||
                                password.text.length > 8) {
                              Utilities.showToastError(
                                  'password atleast 3 character');
                            } else {
                              createUrer();
                            }
                          }),
                      //  Row(
                      //    children: [
                      //      Divider(color: Colors.white,thickness: 2,),
                      //      CustomText(text: 'or',color: Colors.white,),
                      //       Divider(color: Colors.white,thickness: 2,),
                      //    ],
                      //  ),
                      CustomSizedBox(height: 0.02, width: 0),
                      Row(
                        children: [
                          CustomText(
                            text: 'Sign Up with',
                            color: Colors.white,
                          ),
                          CustomSizedBox(height: 0, width: 0.05),
                          CircleAvatar(
                              radius: 23,
                              backgroundColor: Colors.white,
                              child: Image.network(
                                  'https://firebasestorage.googleapis.com/v0/b/oneclx.appspot.com/o/asset%2Ficon%2FGicon.png?alt=media&token=77bcfaa4-662d-4503-8a0a-f31adadc9b57')),
                          CustomSizedBox(
                            height: 0,
                            width: .05,
                          ),
                          CircleAvatar(
                              radius: 23,
                              backgroundColor: Colors.white,
                              child: Image.network(
                                  'https://firebasestorage.googleapis.com/v0/b/oneclx.appspot.com/o/asset%2Ficon%2FFicon.png?alt=media&token=01d5ecea-1d57-4058-b958-db340ebb877f')),
                          CustomSizedBox(
                            height: 0,
                            width: 0.05,
                          ),
                          CircleAvatar(
                              radius: 23,
                              backgroundColor: Colors.white,
                              child: Image.network(
                                  'https://firebasestorage.googleapis.com/v0/b/oneclx.appspot.com/o/asset%2Ficon%2FLicon.png?alt=media&token=456aa250-b8d1-4fb0-8fa1-cddc636a7e1d')),
                          CustomSizedBox(
                            height: 0,
                            width: 0.05,
                          ),
                          CircleAvatar(
                              radius: 23,
                              backgroundColor: Colors.white,
                              child: Image.network(
                                  'https://firebasestorage.googleapis.com/v0/b/oneclx.appspot.com/o/asset%2Ficon%2FLicon.png?alt=media&token=456aa250-b8d1-4fb0-8fa1-cddc636a7e1d'))
                        ],
                      ),

                      CustomSizedBox(height: 0.015, width: 0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CustomText(
                            text: 'Already have an account?',
                            color: Colors.white,
                          ),
                          CustomButton(
                              bgColor: const Color.fromRGBO(187, 222, 251, 1),
                              width: 100,
                              buttonText: 'Sign Up',
                              onPressed: () {})
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }

  createUrer() async {
   
    _showLoaderDialog();
    var url = "${AppUrl.baseUrl}${AppUrl.register}";
    var body = {
      "userName": userName.text.trim().toString(),
      "email": email.text.trim().toString(),
      "password": password.text.trim().toString()
    };
    var uri = Uri.parse(url);
    var response = await http.post(uri, body: body);
    
    if (response.statusCode == 200) {
      
      var data = response.body;
      var json = jsonDecode(data);
      Utilities.showToastSuccess('${json['message']}');
      Navigator.push(context, MaterialPageRoute(builder: (context) => SignInScreen(),));
    } else {
    
      var data = response.body;
      var json = jsonDecode(data);

     
      Utilities.showToastError('${json["message"]}');
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
  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(email.text.trim().toString());
  }
}


