import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hub_flutter/colors.dart';
import 'package:hub_flutter/config/app_url.dart';
import 'package:hub_flutter/constant_file.dart';
import 'package:hub_flutter/screens/google_location.dart';
import 'package:hub_flutter/utilities.dart';
import 'package:hub_flutter/widgets/CustomContainer.dart';
import 'package:hub_flutter/widgets/custom_padding.dart';
import 'package:hub_flutter/widgets/custom_sizedBox.dart';
import 'package:hub_flutter/widgets/custom_text.dart';
import 'package:hub_flutter/widgets/custom_text_form_field.dart';
import 'package:http/http.dart' as http;

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  TextEditingController city = TextEditingController();
  TextEditingController pincode = TextEditingController();
  TextEditingController addressLine = TextEditingController();
  TextEditingController mobileNumber = TextEditingController();
  var countryList = [];
  List<String> stateNameList = [];
  List<String> countryNameList = [];
  String? selectcountryName = 'select country';
  String? selectStateName = 'select state';
  var countryCode;
  List<String> uniqueList = [];
  var stateList;
  @override
  void initState() {
    // TODO: implement initState
    countryName();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              countryNameList == []
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
                              'https://firebasestorage.googleapis.com/v0/b/oneclx.appspot.com/o/asset%2Ficon%2Finfo.png?alt=media&token=574c6342-3ccd-4d9b-91ea-937844c9229c',
                              height: 100,
                            ),
                            CustomSizedBox(height: 0.02, width: 0),
                            CustomContainer(
                                height: 1.1,
                                width: double.infinity,
                                child: CustomPadding(
                                  left: 0.03,
                                  right: 0.03,
                                  top: 0,
                                  bottom: 0,
                                  child: Column(
                                    children: [
                                      CustomText(
                                        text: 'Location & Contact Info',
                                        color: OverAllBgColor,
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      CustomSizedBox(height: 0.02, width: 0),
                                      CustomText(
                                        text: '1 of 6 completed',
                                        color: OverAllBgColor,
                                      ),
                                      Container(
                                        width: double.infinity,
                                        color: OverAllBgColor,
                                        height: 0.03,
                                      ),
                                      CustomSizedBox(height: 0.1, width: 0),
                                      CustomText(
                                        text: 'ADD BUSINESS LOCATION',
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      CustomSizedBox(height: 0.05, width: 0),
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
                                              value: selectcountryName,
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
                                                  selectcountryName = data;
                                                  for (var i = 0;
                                                      i < countryList.length;
                                                      i++) {
                                                    if (selectcountryName ==
                                                        countryList[i]
                                                            ['countryList']) ;
                                                    countryCode = countryList[i]
                                                        ["countryCode"];

                                                    stateName();
                                                  }
                                                });
                                              },
                                              items: countryNameList.map<
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
                                      CustomSizedBox(height: 0.03, width: 0),
                                      stateNameList == []
                                          ? Container()
                                          : CustomContainer(
                                              border: true,
                                              height: 0.07,
                                              width: 0.9,
                                              child: CustomPadding(
                                                top: 0.03,
                                                right: 0.03,
                                                bottom: 0.03,
                                                left: 0.03,
                                                child: DropdownButton<String>(
                                                  style: TextStyle(
                                                      color: Colors.grey),
                                                  isExpanded: true,
                                                  dropdownColor: Colors.white,
                                                  value: selectStateName,
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
                                                    var stateId;
                                                    setState(() {
                                                      selectStateName = data;
                                                      for (var i = 0;
                                                          i <
                                                              stateList
                                                                  .length;
                                                          i++) {
                                                        if (selectStateName ==
                                                            stateList[i]
                                                                ['stateName'])
                                                          ;
                                                       stateId =
                                                            stateList[i]
                                                                ["id"];
                                                      }
                                                      Appconstant.stateId= stateId;
                                                    });
                                                  },
                                                  items: uniqueList.map<
                                                          DropdownMenuItem<
                                                              String>>(
                                                      (String value) {
                                                    return DropdownMenuItem<
                                                        String>(
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
                                      CustomSizedBox(height: 0.03, width: 0),
                                      CustomTextFormField(
                                          controller: city,
                                          hintText: 'Please Enter city',
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          inputFormatters:
                                              FilteringTextInputFormatter(
                                            allow: true,
                                            RegExp("[a-zA-Z0123456789-_-.]"),
                                          ),
                                          icons: Icon(Icons.location_on)),
                                      CustomSizedBox(height: 0.02, width: 0),
                                      CustomTextFormField(
                                          controller: pincode,
                                          hintText: 'Please Enter pincode',
                                          keyboardType: TextInputType.number,
                                          inputFormatters:
                                              FilteringTextInputFormatter(
                                            allow: true,
                                            RegExp("[0123456789]"),
                                          ),
                                          icons: Icon(Icons.location_on)),
                                      CustomSizedBox(height: 0.02, width: 0),
                                      CustomTextFormField(
                                          controller: addressLine,
                                          hintText: 'Please Enter Address',
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          inputFormatters:
                                              FilteringTextInputFormatter(
                                            allow: true,
                                            RegExp("[a-zA-Z0123456789-_-.]"),
                                          ),
                                          icons: Icon(Icons.location_on)),
                                      CustomSizedBox(height: 0.02, width: 0),
                                      CustomTextFormField(
                                          controller: mobileNumber,
                                          hintText: 'Please Enter MobileNumber',
                                          keyboardType: TextInputType.number,
                                          inputFormatters:
                                              FilteringTextInputFormatter(
                                            allow: true,
                                            RegExp("[0123456789]"),
                                          ),
                                          icons: Icon(Icons.location_on)),
                                      CustomSizedBox(height: 0.02, width: 0),
                                      CustomSizedBox(height: 0.09, width: 0),
                                      Row(
                                        children: [
                                          Image.asset(
                                            'assets/person.jpg',
                                            height: 50,
                                          ),
                                          CustomSizedBox(
                                              height: 0, width: 0.05),
                                          InkWell(
                                            child: Image.network(
                                                "https://firebasestorage.googleapis.com/v0/b/oneclx.appspot.com/o/asset%2Flogo%2FLefi.png?alt=media&token=6ce0a918-d370-46ac-8569-13be12e85940"),
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
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
                                              if (selectcountryName ==
                                                  "select country'") {
                                                Utilities.showToastError(
                                                    "Please choose a country name");
                                              } else if (selectStateName ==
                                                  "select state'") {
                                                Utilities.showToastError(
                                                    "Please choose a state name");
                                              } else if (city.text.trim() ==
                                                      null ||
                                                  city.text.trim() == '') {
                                                Utilities.showToastError(
                                                    'Please enter city');
                                              } else if (pincode.text.trim() ==
                                                      null ||
                                                  pincode.text.trim() == '') {
                                                Utilities.showToastError(
                                                    'Please enter pincode');
                                              } else if (addressLine.text
                                                          .trim() ==
                                                      null ||
                                                  addressLine.text.trim() ==
                                                      '') {
                                                Utilities.showToastError(
                                                    'Please enter addressLine');
                                              } else if (mobileNumber.text
                                                          .trim() ==
                                                      null ||
                                                  mobileNumber.text.trim() ==
                                                      '') {
                                                Utilities.showToastError(
                                                    'Please enter mobileNumber');
                                              } else if (mobileNumber
                                                          .text.length >
                                                      10 ||
                                                  mobileNumber.text.length <
                                                      10) {
                                                Utilities.showToastError(
                                                    'Please enter valid mobileNumber');
                                              } else {
                                                Appconstant.countryId =
                                                    int.parse(countryCode);
Appconstant.city=city.text.toString();
Appconstant.pincode=pincode.text.toString();
Appconstant.phoneNumber=int.parse('${mobileNumber.text.toString()}');
Appconstant.address= addressLine.text.toString();
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          GoogleLocation(),
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

  countryName() async {
    var url = "${AppUrl.baseUrl}${AppUrl.countryList}";
    var body = {};
    var uri = Uri.parse(url);
    var response = await http.post(uri, body: body);

    if (response.statusCode == 200) {
      var data = response.body;
      var json = jsonDecode(data);

      countryList = json['data'];
      countryNameList.add('select country');
      List.generate(countryList.length, (index) {
        countryNameList.add(countryList[index]['countryName']);
      });
    }

    setState(() {});
  }

  stateName() async {
    uniqueList.clear();

    var url = "${AppUrl.baseUrl}${AppUrl.stateList}";
    var body = {
      "country_id": countryCode,
    };
    var uri = Uri.parse(url);
    var response = await http.post(uri, body: body);

    if (response.statusCode == 200) {
      var data = response.body;
      var json = jsonDecode(data);

      stateList = json['data'];
      stateNameList.add('select state');
      List.generate(stateList.length, (index) {
        stateNameList.add(stateList[index]['stateName']);
      });
      uniqueList = stateNameList.toSet().toList();
    }

    setState(() {});
  }
}
