import 'package:get/get.dart';

class PatientDetailsStaffController extends GetxController {


  //next page
  bool additionaldata = false;
  onPageChanged(bool x) {
    additionaldata = x;
    update();
  }
}
