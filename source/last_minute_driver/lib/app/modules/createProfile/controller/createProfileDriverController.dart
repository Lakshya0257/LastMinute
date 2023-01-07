// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../../helper/loading.dart';
import '../../../../helper/shared_preference.dart';
import '../../../../helper/snackbar.dart';

import '../../homePage/controller/homePageDriverController.dart';
import '../../homePage/view/homePageDriver.dart';

class CreateProfileDriverController extends GetxController {
  TextEditingController name = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController mobileNumber=TextEditingController();
  TextEditingController bloodGroup=TextEditingController();
  TextEditingController drivingLicence =TextEditingController();
  String value='Male';
  List<String> dropDownList=['Male','Female','Others'];
  onChangedList(String x){
    value=x;
    update();
  }



  final users = FirebaseFirestore.instance.collection('driver');
  final prefs = SPController();
  onCreateProfile() async {
    LoadingUtils.showLoader();
    try {
      await users.doc(prefs.getUserId()).set({
        "name": name.text,
        "address": address.text,
        "mobileNumber": mobileNumber.text,
        'bloodGroup':bloodGroup.text,
        'drivingLicence':drivingLicence.text,
        'driverId':prefs.getUserId()

      }).then((value) {
        
        LoadingUtils.hideLoader();
        HomepageDriver.launch();
        
      });
    } catch (e) {
      LoadingUtils.hideLoader();
      snackbar(e.toString());
    }
  }
}
