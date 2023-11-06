import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hub_flutter/colors.dart';
import 'package:hub_flutter/config/app_url.dart';
import 'package:hub_flutter/constant_file.dart';
import 'package:hub_flutter/screens/business_profile.dart';
import 'package:hub_flutter/screens/sign_up.dart';
import 'package:hub_flutter/utilities.dart';
import 'package:hub_flutter/widgets/CustomContainer.dart';
import 'package:hub_flutter/widgets/custom_button.dart';
import 'package:hub_flutter/widgets/custom_padding.dart';
import 'package:hub_flutter/widgets/custom_sizedBox.dart';
import 'package:hub_flutter/widgets/custom_text.dart';
import 'package:hub_flutter/widgets/custom_text_form_field.dart';
import 'package:http/http.dart' as http;
class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: OverAllBgColor,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          
          children: [
             CustomSizedBox(height: 0.03, width: 0),
         Image.asset('assets/logIn.jpg',height: 200,width: 200,),
         CustomSizedBox(height: 0.02, width: 0),
         CustomContainer(
          gradientColor: false,
          borderRadius: 40,
          height: 0.67, width: double.infinity, child: CustomPadding(
            left: 0.1,right: 0.04,
            top: 0.02,bottom: 0.0,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
              //  crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CustomText(text: 'Sign In',color: OverAllBgColor,fontSize: 20,fontWeight: FontWeight.bold,),
                  ],
                ),
                       CustomSizedBox(height: 0.03, width: 0),
              CustomTextFormField(controller: email,  hintText: "Please enter email",
                 keyboardType: TextInputType.text,
                          inputFormatters: FilteringTextInputFormatter(
                            allow:true,
                             RegExp("[a-zA-Z0123456789-_-.]"),), icons: Icon(Icons.person)),
              CustomSizedBox(height: 0.03, width: 0),
              CustomTextFormField(controller: password, hintText: "Please enter password",    keyboardType: TextInputType.text,
                          inputFormatters: FilteringTextInputFormatter(
                            allow:true,
                             RegExp("[a-zA-Z0123456789-_-.]"),),icons: Icon(Icons.password)),
              CustomSizedBox(height: 0.02, width: 0),
                //      Container(
                // height: 0.3,width: 0.3,child: Text(''),
                // decoration: BoxDecoration(border: Border.all(color: OverAllBgColor)),),
              CustomSizedBox(height: 0.02, width: 0),
              CustomButton(buttonText: 'SUBMIT', onPressed: (){
                if (email.text.trim() == null ||
                                email.text.trim() == '') {
                              Utilities.showToastError('Please enter email');
                            } else if (password.text.trim() == null ||
                                password.text.trim() == '') {
                              Utilities.showToastError('Please enter password');
                            } else if (!email.text.isValidEmail()) {
                              Utilities.showToastError(
                                "Enter valid email address",
                              );
                            } else if (password.text.length < 3 ||
                                password.text.length > 8) {
                              Utilities.showToastError(
                                  'password atleast 3 character');
                            } else {
                              Login();
                            }
               
                
              }),
              CustomText(text: 'or',color: Colors.grey,),
              Row(children: [
                CustomText(text: 'Login with',color: Colors.grey,),
                CustomSizedBox(height: 0, width: 0.05),
                Image.network('https://firebasestorage.googleapis.com/v0/b/oneclx.appspot.com/o/asset%2Ficon%2FGicon.png?alt=media&token=77bcfaa4-662d-4503-8a0a-f31adadc9b57'),
              CustomSizedBox(height: 0, width: .05,),
                Image.network('https://firebasestorage.googleapis.com/v0/b/oneclx.appspot.com/o/asset%2Ficon%2FFicon.png?alt=media&token=01d5ecea-1d57-4058-b958-db340ebb877f'),
                CustomSizedBox(height: 0, width: 0.05,),
                Image.network('https://firebasestorage.googleapis.com/v0/b/oneclx.appspot.com/o/asset%2Ficon%2FLicon.png?alt=media&token=456aa250-b8d1-4fb0-8fa1-cddc636a7e1d'),
                CustomSizedBox(height: 0, width: 0.05,),
                Image.network('https://firebasestorage.googleapis.com/v0/b/oneclx.appspot.com/o/asset%2Ficon%2FLicon.png?alt=media&token=456aa250-b8d1-4fb0-8fa1-cddc636a7e1d')
              ],),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                CustomText(text: 'MobileNumber',color: Colors.grey,),
               CustomButton(
                bgColor:const Color.fromRGBO(187, 222, 251, 1),
                 width: 100,
                
                 buttonText: 'Resend otp', onPressed: (){})
              ],),
              CustomSizedBox(height: 0.015, width: 0),
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                CustomText(text: 'Do you have an account?',color: Colors.grey,),
                CustomButton(
                  width: 100,
                 
                  buttonText: 'Sign Up', onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen(),));
                  })],)
              ],
                     ),
            ),
          ))
        ],),
      )
    );
  }
  Login() async {
   
    _showLoaderDialog();
    var url = "${AppUrl.baseUrl}${AppUrl.logInUser}";
    var body = {
      "email": email.text.trim().toString(),
      "password": password.text.trim().toString()
    };
    var uri = Uri.parse(url);
    var response = await http.post(uri, body: body);
    
    if (response.statusCode == 200) {
      
      var data = response.body;
      var json = jsonDecode(data);
       Appconstant.userId= json["user_id"];
      Utilities.showToastSuccess('${json['message']}');

     Navigator.push(context, MaterialPageRoute(builder: (context) => BusinessProfile(),));
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
}

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}
