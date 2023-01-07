// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../../helper/loading.dart';
import '../../../../helper/shared_preference.dart';
import '../../../../helper/snackbar.dart';
import '../../homePage/view/homePageStaff.dart';



class CreateProfileStaffController extends GetxController {
  TextEditingController name = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController mobileNumber = TextEditingController();
  TextEditingController bloodGroup = TextEditingController();
  TextEditingController medicalLicence = TextEditingController();
  String value = 'Male';
  List<String> dropDownList = ['Male', 'Female', 'Others'];
  onChangedList(String x) {
    value = x;
    update();
  }

  final users = FirebaseFirestore.instance.collection('staff');
  final prefs = SPController();
  onCreateProfileStaff() async {
    LoadingUtils.showLoader();
    try {
      await users.doc(prefs.getUserId()).set({
        "name": name.text,
        "address": address.text,
        "mobileNumber": mobileNumber.text,
        'bloodGroup': bloodGroup.text,
        'medicalLicence': medicalLicence.text,
        'staffId': prefs.getUserId()
      }).then((value) {
        LoadingUtils.hideLoader();
        HomepageStaff.launch();
        
      });
    } catch (e) {
      LoadingUtils.hideLoader();
      snackbar(e.toString());
    }
  }
}
