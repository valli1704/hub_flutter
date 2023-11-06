import 'package:flutter/material.dart';
import 'package:hub_flutter/colors.dart';
import 'package:hub_flutter/config/app_url.dart';
import 'package:hub_flutter/constant_file.dart';
import 'package:hub_flutter/screens/add_business_description.dart';
import 'package:hub_flutter/screens/congrats.dart';
import 'package:hub_flutter/screens/location.dart';
import 'package:hub_flutter/screens/publish.dart';
import 'package:hub_flutter/screens/upload_business_photos.dart';
import 'package:hub_flutter/utilities.dart';
import 'package:hub_flutter/widgets/CustomContainer.dart';
import 'package:hub_flutter/widgets/custom_button.dart';
import 'package:hub_flutter/widgets/custom_padding.dart';
import 'package:hub_flutter/widgets/custom_sizedBox.dart';
import 'package:hub_flutter/widgets/custom_text.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
class uploadHeader extends StatefulWidget {
  const uploadHeader({super.key});

  @override
  State<uploadHeader> createState() => _uploadHeaderState();
}

class _uploadHeaderState extends State<uploadHeader> {
  var imageFile;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              CustomContainer(
                  gradientColor: true,
                  height: 1.15,
                  width: double.infinity,
                  child: Column(
                    children: [
                      CustomSizedBox(height: 0.05, width: 0),
                      Image.network(
                        'https://firebasestorage.googleapis.com/v0/b/oneclx.appspot.com/o/asset%2Ficon%2FBI.png?alt=media&token=0d982904-2abe-4d03-811c-10364404ef8b',
                        height: 100,
                      ),
                      CustomSizedBox(height: 0.02, width: 0),
                      CustomContainer(
                          height: 0.9,
                          width: double.infinity,
                          child: CustomPadding(
                            left: 0.03,
                            right: 0.03,
                            top: 0,
                            bottom: 0,
                            child: Column(
                              children: [
                                CustomText(
                                  text: 'ADD BUSINESS IMAGES',
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
                                CustomSizedBox(height: 0.05, width: 0),
                                CustomText(
                                  text: 'ADD PHOTES OF YOUR BUSINESS',
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                                CustomSizedBox(height: 0.1, width: 0),
                                CustomText(
                                  text:
                                      'Business Photes create your customers first ',
                                  fontSize: 15,
                                ),
                                CustomText(
                                  text:
                                      'impressetion of your company.The best   ',
                                  fontSize: 15,
                                ),
                                CustomText(
                                  text:
                                      'photos send a message to customers about   ',
                                  fontSize: 15,
                                ),
                                CustomText(
                                  text:
                                      'the companys values, create brand loyalty,a ',
                                  fontSize: 15,
                                ),
                                CustomText(
                                  text:
                                      'and sign a more professional appearance  ',
                                  fontSize: 15,
                                ),
                                CustomSizedBox(height: 0.02, width: 0),
                                CustomText(
                                  text:
                                      'Upload header image for your business the',
                                  fontSize: 15,
                                ),
                                
                                     Center(
                                        child: CustomText(
                                          text: '(Size:540*540 Pixels)',
                                          fontSize: 15,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    
                                CustomSizedBox(height: 0.02, width: 0),
                                CustomButton(
                                    buttonText: 'Upload Image',
                                    onPressed: () async {
                                      await _showChoiceDialog(context);
                                    }),
                                CustomSizedBox(height: 0.02, width: 0),
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.2,
                                  width:
                                      MediaQuery.of(context).size.width * 0.35,
                                  decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.circular(20)),
                                  child:imageFile == null? Center(
                                      child: CustomText(
                                    text: 'IMAGE',
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                  )):Image.file(
                                        File(imageFile.path.toString()),
                                        fit: BoxFit.cover,
                                        height: 150,
                                        width: double.infinity,
                                      ),
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/person.jpg',
                                      height: 50,
                                    ),
                                    CustomSizedBox(height: 0, width: 0.05),
                                    InkWell(
                                      child: Image.network(
                                          "https://firebasestorage.googleapis.com/v0/b/oneclx.appspot.com/o/asset%2Flogo%2FLefi.png?alt=media&token=6ce0a918-d370-46ac-8569-13be12e85940"),
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                    CustomSizedBox(height: 0, width: 0.05),
                                    CustomText(
                                      text: 'SWIPE',
                                      color: OverAllBgColor,
                                    ),
                                    CustomSizedBox(height: 0, width: 0.05),
                                    InkWell(
                                      child: Image.network(
                                          "https://firebasestorage.googleapis.com/v0/b/oneclx.appspot.com/o/asset%2Flogo%2FRight.png?alt=media&token=6f429db7-33c2-4063-865b-f0f8417a4acc"),
                                      onTap: () async {
                                        if (imageFile == null) {
                                          Utilities.showToastError(
                                              "Please choose the image");
                                        } else {
                                          Appconstant.headerImg= imageFile.path.toString();
                                           await uploadImage(imageFile.path);
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => Publish(),
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
        ));
  }
uploadImage(filename) async {
    var request = http.MultipartRequest(
        'POST', Uri.parse("${AppUrl.baseUrl}${AppUrl.uploadImage}"));
    var r = await http.MultipartFile.fromPath('file', filename);
    request.files.add(await http.MultipartFile.fromPath('file', filename));

    var res = await request.send();
   
  }
 
  Future<void> _showChoiceDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            backgroundColor: Colors.transparent,
            child: Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            _openCamera(context);
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.18,
                            margin: const EdgeInsets.only(right: 5),
                            decoration: const BoxDecoration(
                                color: Colors.white24,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.camera_alt_outlined,
                                  color: Colors.black45,
                                  size: 38,
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                CustomText(
                                  text: 'Take photo from camera',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w800,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.06,
                        width: 1,
                        color: Colors.blue,
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            _openGallery(context);
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.18,
                            margin: const EdgeInsets.only(left: 5, right: 5),
                            decoration: const BoxDecoration(
                                color: Colors.white24,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.add_photo_alternate,
                                  color: Colors.black45,
                                  size: 38,
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                CustomText(
                                  text: "Choose photo from gallery",
                                  fontSize: 14,
                                  fontWeight: FontWeight.w800,
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }

  void _openGallery(BuildContext context) async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    setState(() {
      imageFile = pickedFile;
    });

    Navigator.pop(context);
  }

  void _openCamera(BuildContext context) async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
    );
    setState(() {
      imageFile = pickedFile;
    });
    Navigator.pop(context);
  }
}
