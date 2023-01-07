
// ignore_for_file: file_names

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:last_minute_driver/app/modules/after_login/view/after_login.dart';
import 'package:last_minute_driver/app/modules/createProfile/view/createProfileDriver.dart';
import 'package:last_minute_driver/app/modules/createProfile/view/createProfileStaff.dart';
import 'package:last_minute_driver/app/modules/homePage/view/homePageDriver.dart';

import '../../../../helper/loading.dart';
import '../../../../helper/shared_preference.dart';
import '../../../../helper/snackbar.dart';
import '../../homePage/view/homePageStaff.dart';




class LogInController extends GetxController {
  TextEditingController mobileNumberController = TextEditingController();
  final prefs = SPController();
  final auth = FirebaseAuth.instance;
  final users = FirebaseFirestore.instance.collection('users');

  

  //Otp Screen
  final _sendOtp = false.obs;
  bool get sendOtp => _sendOtp.value;
  late String _verificationId;
  onSendOtp() async {
    if (mobileNumberController.text.length != 10) {
      snackbar("Please enter a valid mobile number");
      return;
    }
    ;
    log("Sending Otp to: ${mobileNumberController.text}");
    _sendOtp(true);
    auth.verifyPhoneNumber(
      phoneNumber: "+91${mobileNumberController.text}",
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {
        print(e);
      },
      codeSent: (String verificationId, int? resendToken) {
        _verificationId = verificationId;
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  //Otp value
  final _otp = ''.obs;
  String get otp => _otp.value;
  onChangedOtp(String x) {
    _otp(x);
  }

  bool driverLog=true;
  onLoginType(bool x){
    driverLog=x;
    update();
  }

  onLogin() async {
    LoadingUtils.showLoader();
    log("otp: $otp");
    try {
      var credential = PhoneAuthProvider.credential(
          verificationId: _verificationId, smsCode: otp);
      log("verfication completed");
      
          await auth.signInWithCredential(credential).then((userCredential) {
        var uid = userCredential.user!.uid;
        prefs.setIsLoggedin(true);
        prefs.setUserId(uid);
        if(driverLog){
          prefs.setLoginType('driver');
        
        FirebaseFirestore.instance.collection('driver').doc(uid).get().then((user) {
          LoadingUtils.hideLoader();
          if (user.exists) {
            HomepageDriver.launch();
          } else {
            CreateProfileDriver.launch();
          }
        });
        }
        else{
          prefs.setLoginType('staff');
        
        FirebaseFirestore.instance.collection('staff').doc(uid).get().then((user) {
          LoadingUtils.hideLoader();
          if (user.exists) {
            HomepageStaff.launch();
          } else {
            CreateProfileStaff.launch();
          }
        });
        }
        
      });
    } catch (e) {
      LoadingUtils.hideLoader();
      snackbar(e.toString());
      _sendOtp(false);
    }
  }
}
