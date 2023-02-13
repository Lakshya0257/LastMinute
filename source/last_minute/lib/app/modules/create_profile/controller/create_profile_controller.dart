import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:last_minute/app/modules/homepage/view/homepage.dart';
import 'package:last_minute/helper/loading.dart';
import 'package:last_minute/helper/shared_preference.dart';
import 'package:last_minute/helper/snackbar.dart';

class CreateProfileController extends GetxController {
  TextEditingController name = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  final users = FirebaseFirestore.instance.collection('users');
  final prefs = SPController();
  onCreateProfile() async {
    LoadingUtils.showLoader();
    try {
      await users.doc(prefs.getUserId()).set({
        'user Id':SPController().getUserId(),
        "name": name.text,
        "address": address.text,
        "phone":phoneNumber.text,
        "city":city.text,
        "state":state.text
      }).then((value) {
        LoadingUtils.hideLoader();
        Homepage.launch();
      });
    } catch (e) {
      LoadingUtils.hideLoader();
      snackbar(e.toString());
    }
  }
}
