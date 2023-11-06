import 'package:flutter/material.dart';
import 'package:hub_flutter/screens/add_business_description.dart';
import 'package:hub_flutter/screens/business_image_upload_logo.dart';
import 'package:hub_flutter/screens/business_profile.dart';
import 'package:hub_flutter/screens/google_location.dart';
import 'package:hub_flutter/screens/location.dart';
import 'package:hub_flutter/screens/publish.dart';
import 'package:hub_flutter/screens/splash_scrren.dart';
import 'package:hub_flutter/screens/upload_business_photos.dart';
import 'package:hub_flutter/screens/upload_header.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
   
      home:SplashScreen()
    );
  }
}

