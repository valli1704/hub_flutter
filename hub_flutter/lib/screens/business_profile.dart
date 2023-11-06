import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hub_flutter/colors.dart';
import 'package:hub_flutter/config/app_url.dart';
import 'package:hub_flutter/constant_file.dart';
import 'package:hub_flutter/screens/google_location.dart';
import 'package:hub_flutter/screens/location.dart';
import 'package:hub_flutter/utilities.dart';
import 'package:hub_flutter/widgets/CustomContainer.dart';
import 'package:hub_flutter/widgets/custom_padding.dart';
import 'package:hub_flutter/widgets/custom_sizedBox.dart';
import 'package:hub_flutter/widgets/custom_text.dart';
import 'package:hub_flutter/widgets/custom_text_form_field.dart';
import 'package:http/http.dart' as http;

class BusinessProfile extends StatefulWidget {
  const BusinessProfile({super.key});

  @override
  State<BusinessProfile> createState() => _BusinessProfileState();
}

class _BusinessProfileState extends State<BusinessProfile> {
  @override
  void initState() {
    // TODO: implement initState

    businessType();

    super.initState();
  }

  List<String> businessNameList = [];
  var businessList;
  String? selectBusinessName = 'select businessName';
  TextEditingController businessName = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              businessNameList == []
                  ? CircularProgressIndicator(
                      backgroundColor: Colors.black,
                      color: Colors.black,
                    )
                  : CustomContainer(
                      gradientColor: true,
                      height: 0.999,
                      width: double.infinity,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: [
                            CustomSizedBox(height: 0.05, width: 0),
                            Image.network(
                              'https://firebasestorage.googleapis.com/v0/b/oneclx.appspot.com/o/asset%2Ficon%2FBP.png?alt=media&token=691c22f3-68af-4df3-a66c-97d23e551355',
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
                                        text: 'Business Profile',
                                        color: OverAllBgColor,
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      CustomSizedBox(height: 0.02, width: 0),
                                      CustomText(
                                        text: '0 of 6 completed',
                                        color: OverAllBgColor,
                                      ),
                                      Container(
                                        width: double.infinity,
                                        color: OverAllBgColor,
                                        height: 0.03,
                                      ),
                                      CustomSizedBox(height: 0.1, width: 0),
                                      CustomText(
                                        text: 'CREATE BUSINESS PROFILE',
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      CustomSizedBox(height: 0.05, width: 0),
                                      CustomText(
                                        text: 'Start Building Your',
                                        fontSize: 20,
                                      ),
                                      CustomSizedBox(height: 0.02, width: 0),
                                      CustomText(
                                        text: 'Business Profile',
                                        fontSize: 20,
                                      ),
                                      CustomSizedBox(height: 0.05, width: 0),
                                      CustomTextFormField(
                                          controller: businessName,
                                          hintText:
                                              'Please Enter Business Name',
                                          keyboardType: TextInputType.text,
                                          inputFormatters:
                                              FilteringTextInputFormatter(
                                            allow: true,
                                            RegExp("[a-zA-Z]"),
                                          ),
                                          icons: Icon(Icons.business)),
                                      CustomSizedBox(height: 0.02, width: 0),
                                      CustomContainer(
                                          border: true,
                                          height: 0.07,
                                          width: 0.9,
                                          child: CustomPadding(
                                            top: 0.03,
                                            right: 0.03,
                                            bottom: 0.03,
                                            left: 0.03,
                                            child: DropdownButton<String>(
                                              style:
                                                  TextStyle(color: Colors.grey),
                                              isExpanded: true,
                                              dropdownColor: Colors.white,
                                              value: selectBusinessName,
                                              icon: Icon(
                                                Icons.arrow_drop_down,
                                                color: Colors.black,
                                              ),
                                              iconSize: 24,
                                              elevation: 8,
                                              //  style: tableSubHeading,
                                              underline: Container(
                                                height: 1,
                                                color: Colors.transparent,
                                              ),
                                              onChanged: (data) {
                                                setState(() {
                                                  selectBusinessName = data;
                                                  for(var i =0;i<businessList.length;i++) {
                                                    if(selectBusinessName==businessList[i]['businessName']){
                                                      Appconstant.businessTypeId=businessList[i]['id'];
                                                    }
                                                  }
                                                });
                                              },
                                              items: businessNameList.map<
                                                      DropdownMenuItem<String>>(
                                                  (String value) {
                                                return DropdownMenuItem<String>(
                                                  value: value,
                                                  child: Container(
                                                      child: Text(
                                                    value,
                                                    style: TextStyle(
                                                        color: Colors.grey),
                                                  )),
                                                );
                                              }).toList(),
                                            ),
                                          )),
                                      CustomSizedBox(height: 0.09, width: 0),
                                      Row(
                                        children: [
                                          Image.asset(
                                            'assets/person.jpg',
                                            height: 50,
                                          ),
                                          CustomSizedBox(
                                              height: 0, width: 0.05),
                                          CustomText(
                                            text: 'SWIPE',
                                            color: OverAllBgColor,
                                          ),
                                          CustomSizedBox(
                                              height: 0, width: 0.05),
                                          InkWell(
                                            child: Image.network(
                                                "https://firebasestorage.googleapis.com/v0/b/oneclx.appspot.com/o/asset%2Flogo%2FRight.png?alt=media&token=6f429db7-33c2-4063-865b-f0f8417a4acc"),
                                            onTap: () {
                                              if (businessName.text.trim() == null ||
                                businessName.text.trim() == '') {
                                                Utilities.showToastError(
                                                    "please enter the businee name");
                                              } else if (selectBusinessName =="select businessName'") {
                                                Utilities.showToastError(
                                                    "Please choose a business name");
                                              }
                                              else {
                                                Appconstant.businessName= businessName.text.trim();
                                               
Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        LocationScreen(),
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
                        ),
                      ))
            ],
          ),
        ));
  }

  businessType() async {
    var url = "${AppUrl.baseUrl}${AppUrl.listBusinessType}";
    var body = {};
    var uri = Uri.parse(url);
    var response = await http.post(uri, body: body);

    if (response.statusCode == 200) {
      var data = response.body;
      var json = jsonDecode(data);

       businessList = json['data'];
      businessNameList.add("select businessName");
      List.generate(businessList.length, (index) {
        businessNameList.add(businessList[index]['businessName']);
      });
    }

    setState(() {});
  }
}
