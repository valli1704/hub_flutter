import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
class Utilities {
 static showToastSuccess(String message) {
     Fluttertoast.showToast(msg: message,
     textColor: Colors.white,
     backgroundColor: Colors.green,
     webPosition: 'top'
     
     );

  }
  static showToastError(String message) {
     Fluttertoast.showToast(msg: message,
     textColor: Colors.white,
     backgroundColor: Colors.red,
     webPosition: 'top'
     
     );

  }
}