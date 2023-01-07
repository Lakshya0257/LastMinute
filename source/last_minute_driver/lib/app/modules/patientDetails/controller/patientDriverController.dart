import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class PatientDetailsDriverController extends GetxController {

  //next page
  bool additionaldata = false;
  onPageChanged(bool x) {
    additionaldata = x;
    update();
  }

}
