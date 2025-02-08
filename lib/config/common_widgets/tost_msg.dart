import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showCustomToast(String message, bool isSuccess) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.TOP,
    backgroundColor: Colors.white,
    textColor: isSuccess ? Colors.green : Colors.red,
    fontSize: 16.0,
  );
}
