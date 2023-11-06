import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hub_flutter/colors.dart';
import 'package:hub_flutter/constant_file.dart';
import 'package:hub_flutter/screens/business_image_upload_logo.dart';
import 'package:hub_flutter/screens/location.dart';
import 'package:hub_flutter/utilities.dart';
import 'package:hub_flutter/widgets/CustomContainer.dart';
import 'package:hub_flutter/widgets/custom_padding.dart';
import 'package:hub_flutter/widgets/custom_sizedBox.dart';
import 'package:hub_flutter/widgets/custom_text.dart';
import 'package:hub_flutter/widgets/custom_text_form_field.dart';

class AddBusiness extends StatefulWidget {
  const AddBusiness({super.key});

  @override
  State<AddBusiness> createState() => _AddBusinessState();
}

class _AddBusinessState extends State<AddBusiness> {
  TextEditingController description = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController websiteUrl = TextEditingController();
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
                        'https://firebasestorage.googleapis.com/v0/b/oneclx.appspot.com/o/asset%2Ficon%2FBD.png?alt=media&token=88d7acab-112e-47e1-b6b6-9b7c0f94b91a',
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
                                  text: 'ADD BUSINESS DESCRIPTION',
                                  color: OverAllBgColor,
                                  fontSize: 20,
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
                                  text: 'PIN YOUR BUSINESS LOCATION',
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                                CustomSizedBox(height: 0.05, width: 0),
                                CustomText(
                                  text: 'Provide an overview of the',
                                  fontSize: 20,
                                ),
                                CustomSizedBox(height: 0.02, width: 0),
                                CustomText(
                                  text: 'business,This description provides',
                                  fontSize: 20,
                                ),
                                CustomSizedBox(height: 0.02, width: 0),
                                CustomText(
                                  text: 'extensive details outlining the business.',
                                  fontSize: 20,
                                ),
                                CustomSizedBox(height: 0.02, width: 0),
                              CustomTextFormField(controller: description,contentPadding: true, hintText: 'Plese enter description', 
                                 keyboardType: TextInputType.text,
                          inputFormatters: FilteringTextInputFormatter(
                            allow:true,
                             RegExp("[a-zA-Z0123456789-_-.]"),),
                              icons: Icon(Icons.description)),
                              CustomSizedBox(height: 0.02, width: 0),
                               CustomTextFormField(controller: email,  hintText: 'Plese enter EmailId',   keyboardType: TextInputType.emailAddress,
                          inputFormatters: FilteringTextInputFormatter(
                            allow:true,
                             RegExp("[a-zA-Z0123456789-_-.]"),), icons: Icon(Icons.email)),
                               CustomSizedBox(height: 0.02, width: 0),
                                CustomTextFormField(controller: websiteUrl,  hintText: 'Plese enter Website Url',   keyboardType: TextInputType.text,
                          inputFormatters: FilteringTextInputFormatter(
                            allow:true,
                             RegExp("[a-zA-Z0123456789-_-.]"),), icons: Icon(Icons.web)),
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
                                          if (description.text.trim() == null ||
                                description.text.trim() == '') {
                              Utilities.showToastError('Please enter description');
                            }
                            else if (email.text.trim() == null ||
                                email.text.trim() == '') {
                              Utilities.showToastError('Please enter email');
                            }
                            else if (websiteUrl.text.trim() == null ||
                                websiteUrl.text.trim() == '') {
                              Utilities.showToastError('Please enter websiteUrl');
                            }
                            else if(!email.text.isValidEmail()){
                               Utilities.showToastError('Please enter valid email');
                            }
                                      else{
                                        Appconstant.description=description.text.trim();
                                        Appconstant.websiteUrl= websiteUrl.text.trim();
                                        Appconstant.emailId = email.text.trim();
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  uploadImage(),
                                            ));
                                      }
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
extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}