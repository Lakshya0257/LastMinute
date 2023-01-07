import 'package:flutter/material.dart';
import 'package:get/get.dart';

void snackbar(message) {
  Get.showSnackbar(GetSnackBar(
    duration: Duration(seconds: 3),
    backgroundColor: Colors.yellow,
    messageText: Text(
      message,
      style: TextStyle(fontWeight: FontWeight.bold),
    ),
  ));
}
